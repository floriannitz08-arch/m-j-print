create table public.addresses (
id uuid primary key default gen_random_uuid(),
user_id uuid not null references auth.users(id) on delete cascade,
recipient text not null check(char_length(recipient) between 1 and 150),
street text not null check(char_length(street) between 1 and 200),
postal_code text not null check(postal_code ~ '^[0-9]{5}$'),
city text not null check(char_length(city) between 1 and 100),
country text not null default 'DE' check(country='DE'),
created_at timestamptz not null default now()
);
alter table public.addresses enable row level security;
create policy "Own addresses" on public.addresses for all to authenticated using(auth.uid()=user_id) with check(auth.uid()=user_id);
