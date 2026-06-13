USE sakila;
SELECT
    f.film_id,
    f.title,
    l.name AS language,
    c.name AS category,
    CONCAT(a.first_name,' ',a.last_name) AS actor_name,
    r.rental_date,
    p.amount,
    CONCAT(cu.first_name,' ',cu.last_name) AS customer_name,
    ci.city,
    co.country
FROM film f
LEFT JOIN language l
    ON f.language_id = l.language_id
LEFT JOIN film_category fc
    ON f.film_id = fc.film_id
LEFT JOIN category c
    ON fc.category_id = c.category_id
LEFT JOIN film_actor fa
    ON f.film_id = fa.film_id
LEFT JOIN actor a
    ON fa.actor_id = a.actor_id
LEFT JOIN inventory i
    ON f.film_id = i.film_id
LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
LEFT JOIN customer cu
    ON r.customer_id = cu.customer_id
LEFT JOIN payment p
    ON r.rental_id = p.rental_id
LEFT JOIN address ad
    ON cu.address_id = ad.address_id
LEFT JOIN city ci
    ON ad.city_id = ci.city_id
LEFT JOIN country co
    ON ci.country_id = co.country_id;
