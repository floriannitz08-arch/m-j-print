create table public.products (id text primary key, name text not null, active boolean not null default false, base_cents integer not null check(base_cents>=0));
create table public.orders (id uuid primary key default gen_random_uuid(), user_id uuid not null references auth.users(id), status text not null default 'draft' check(status in ('draft','pending','paid','production','shipped','cancelled')), total_cents integer not null check(total_cents>=0), created_at timestamptz not null default now(), shipping_address jsonb not null);
create table public.order_items (id uuid primary key default gen_random_uuid(), order_id uuid not null references public.orders(id), product_id text not null references public.products(id), quantity integer not null check(quantity>0), price_cents integer not null check(price_cents>=0), options jsonb not null default '{}');
alter table public.products enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
create policy "Active products" on public.products for select using(active);
create policy "Own orders" on public.orders for select to authenticated using(auth.uid()=user_id);
create policy "Own order items" on public.order_items for select to authenticated using(exists(select 1 from public.orders o where o.id=order_id and o.user_id=auth.uid()));
insert into storage.buckets(id,name,public) values ('artwork','artwork',false) on conflict(id) do nothing;
create policy "Own artwork read" on storage.objects for select to authenticated using(bucket_id='artwork' and (storage.foldername(name))[1]=auth.uid()::text);
create policy "Own artwork insert" on storage.objects for insert to authenticated with check(bucket_id='artwork' and (storage.foldername(name))[1]=auth.uid()::text);
-- Order writes intentionally restricted to trusted backend; no browser price authority.
