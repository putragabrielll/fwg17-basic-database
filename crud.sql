-- Table Users
INSERT INTO users
(id, "name", "level", images, phone, alamat, email, "password", "createdAt", "updatedAt")
VALUES(1, 'gabriel', 'user', '1.jpg', '085155556666', 'Bekasi', 'puragmahk@gmail.com', 'putra123', '2023-11-06 21:18:37.109', NULL);

UPDATE users
SET "name"='gabriel', "level"='user', images='', phone='0808080089832', alamat='Bekasi', email='puragmahk@gmail.com', "password"='putra123', "createdAt"='2023-11-06 21:18:37.109', "updatedAt"=NULL
WHERE id=1;

DELETE FROM users WHERE id=1;

SELECT * FROM users



-- Table Product
INSERT INTO product (id, name_product, images, desk_product, qty, status, "createdAt", "updatedAt")
VALUES(1, 'kopi susu', 'kopi-susu.png', NULL, 5, true, '2023-11-06 21:31:19.938', NULL);

UPDATE product SET name_product='kopi susu', images='kopi-susu.png', desk_product=NULL, qty=5, status=true, "createdAt"='2023-11-06 21:31:19.938', "updatedAt"=NULL
WHERE id=1;

DELETE FROM product WHERE id=1;

SELECT * FROM product


-- Table Promo
INSERT INTO promo (id, code, images, min_order, max_discount, "percent", description, qty, status, "createdAt", "updatedAt")
VALUES(1, 'FAZZFOOD50', 'promo.png', 50000, 50000, 0.5, NULL, 100, true, '2023-11-06 22:13:56.332', NULL);

UPDATE promo SET code='FAZZFOOD50', images='promo.png', min_order=50000, max_discount=50000, "percent"=0.5, description=NULL, qty=100, status=true, "createdAt"='2023-11-06 22:13:56.332', "updatedAt"=NULL
WHERE id=1;

DELETE FROM promo WHERE id=1;

SELECT * FROM promo


-- Table Order
INSERT INTO public."order" (id, user_id, product_id, promo_id, date_order, qty, status_order, noted, "createdAt", "updatedAt")
VALUES(2, 1, 1, 1, '2023-11-06', 2, 1, 'siap bos kuu.', '2023-11-06 22:17:47.144', NULL);

UPDATE public."order" SET user_id=1, product_id=1, promo_id=1, date_order='2023-11-06', qty=2, status_order=1, noted='siap bos kuu.', "createdAt"='2023-11-06 22:17:47.144', "updatedAt"=NULL
WHERE id=2;

DELETE FROM order WHERE id=2;

SELECT * FROM order