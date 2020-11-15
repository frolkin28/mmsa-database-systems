select p.first_name, 
p.last_name, 
count(distinct o.id) as total_orders,
sum(oi.quantity) as total_items_bought, 
sum((oi.quantity * i.price) - oi.discount) as total_money_spent
from `person` as p
left join `order` as o on p.id = o.person_id
left join `order_item` as oi on o.id = oi.order_id
left join `item` as i on i.id = oi.item_id
group by p.id