create table public.payment_sessions (id uuid primary key default gen_random_uuid(),order_id uuid not null unique references public.orders(id),provider_session_id text unique,amount_cents integer not null check(amount_cents>0),currency text not null default 'eur' check(currency='eur'),created_at timestamptz not null default now());
create table public.payment_events (provider_event_id text primary key,received_at timestamptz not null default now());
alter table public.payment_sessions enable row level security;
alter table public.payment_events enable row level security;
-- No client access. Trusted backend only.
create or replace function public.record_test_payment(p_event text,p_session text,p_amount integer,p_currency text) returns boolean language plpgsql security invoker set search_path=public as $$
declare target uuid;
begin
insert into public.payment_events(provider_event_id) values(p_event) on conflict do nothing;
if not found then return false; end if;
select order_id into target from public.payment_sessions where provider_session_id=p_session and amount_cents=p_amount and currency=p_currency for update;
if not found then raise exception 'Payment mismatch'; end if;
update public.orders set status='paid' where id=target and status='pending' and total_cents=p_amount;
if not found then raise exception 'Order mismatch'; end if;
return true;
end $$;
revoke all on function public.record_test_payment(text,text,integer,text) from public,anon,authenticated;
grant execute on function public.record_test_payment(text,text,integer,text) to service_role;
