create table public.invoices (
id uuid primary key default gen_random_uuid(),
order_id uuid not null unique references public.orders(id),
invoice_number text not null unique,
issued_at timestamptz not null default now(),
seller jsonb not null,
buyer jsonb not null,
lines jsonb not null,
net_cents integer not null check(net_cents>=0),
tax_cents integer not null check(tax_cents>=0),
gross_cents integer not null check(gross_cents=net_cents+tax_cents),
currency text not null default 'EUR' check(currency='EUR')
);
alter table public.invoices enable row level security;
create policy "Own invoices" on public.invoices for select to authenticated using(exists(select 1 from public.orders o where o.id=order_id and o.user_id=auth.uid()));
-- Issuance remains restricted to a trusted backend after legal and tax configuration.
