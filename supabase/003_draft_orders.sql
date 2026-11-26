-- Drafts only; no payment or production authorization.
create or replace function public.create_draft_order(p_address jsonb,p_items jsonb)
returns uuid language plpgsql security invoker set search_path=public as $$
declare oid uuid; item jsonb; product public.products%rowtype; qty integer; finish text; cents integer; total integer:=0;
begin
if auth.uid() is null then raise exception 'Authentication required'; end if;
if jsonb_typeof(p_items) is distinct from 'array' or jsonb_array_length(p_items) not between 1 and 50 then raise exception 'Invalid items'; end if;
if jsonb_typeof(p_address) is distinct from 'object' or coalesce(p_address->>'recipient','')='' or coalesce(p_address->>'street','')='' or coalesce(p_address->>'city','')='' or coalesce(p_address->>'postal_code','') !~ '^[0-9]{5}$' or p_address->>'country' is distinct from 'DE' then raise exception 'Invalid address'; end if;
insert into public.orders(user_id,status,total_cents,shipping_address) values(auth.uid(),'draft',0,p_address) returning id into oid;
for item in select value from jsonb_array_elements(p_items) loop
select * into product from public.products where id=item->>'id' and active;
if not found then raise exception 'Invalid product'; end if;
qty:=(item->>'quantity')::integer; finish:=item->>'finish';
if qty is null or qty not in (100,250,500,1000) or finish is null or finish not in ('Standard','Matt','Goldfolie') then raise exception 'Invalid options'; end if;
cents:=product.base_cents*(case qty when 100 then 1 when 250 then 2 when 500 then 3 else 5 end)+(case finish when 'Matt' then 500 when 'Goldfolie' then 1200 else 0 end);
insert into public.order_items(order_id,product_id,quantity,price_cents,options) values(oid,product.id,qty,cents,jsonb_build_object('finish',finish));
total:=total+cents;
end loop;
update public.orders set total_cents=total where id=oid;
return oid;
end $$;
-- Invoke only through a restricted trusted role. Browser roles must not write orders directly.
revoke all on function public.create_draft_order(jsonb,jsonb) from public,anon,authenticated;
-- A later migration must provision a narrowly scoped execution role and verified identity context before enabling this function.
