create table public.shipments(id uuid primary key default gen_random_uuid(),order_id uuid not null references public.orders(id),carrier text not null,tracking_number text not null,shipped_at timestamptz not null default now(),unique(carrier,tracking_number));
alter table public.shipments enable row level security;
create policy "Own shipments" on public.shipments for select to authenticated using(exists(select 1 from public.orders o where o.id=order_id and o.user_id=auth.uid()));
create table public.coupons(code text primary key,percent_off integer not null check(percent_off between 1 and 100),active boolean not null default false,expires_at timestamptz);
alter table public.coupons enable row level security;
create table public.notification_outbox(id uuid primary key default gen_random_uuid(),order_id uuid not null references public.orders(id),kind text not null,status text not null default 'pending' check(status in ('pending','sent','failed')),created_at timestamptz not null default now(),unique(order_id,kind));
alter table public.notification_outbox enable row level security;
-- All writes restricted to trusted backend.
