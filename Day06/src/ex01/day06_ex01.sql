WITH get_discount AS (
SELECT person_id, pizzeria_id, COUNT(pizzeria_id), 
    CASE
        WHEN COUNT(pizzeria_id) = 1 THEN 10.5
        WHEN COUNT(pizzeria_id) = 2 THEN 22
        ELSE 30
    END AS discount
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
GROUP BY person_id,pizzeria_id
ORDER BY 1)

insert into person_discounts(id,person_id,pizzeria_id,discount)
SELECT ROW_NUMBER() OVER () AS id, person_id, pizzeria_id, discount
FROM get_discount;