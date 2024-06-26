-- Create table users
create table if not exists "users"(
"id" serial primary key,
"name" varchar (255) unique not null,
"level" varchar (5) not null default 'user',
"images" varchar (255),
"phone" varchar (15) not null,
"address" varchar (255) not null,
"email" varchar (50) unique not null,
"password" varchar (255) not null,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);
-- Create table product
create table if not exists "product"(
"id" serial primary key,
"name" varchar (255) not null,
"images" varchar (255),
"price" decimal not null,
"description" text,
"qty" int not null,
"status" boolean not null default true,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);
-- Create table promo
create table if not exists "promo"(
"id" serial primary key,
"code" varchar(20) not null,
"images" varchar(255),
"min_order" int not null,
"max_discount" int not null,
"percent" decimal not null,
"description" text,
"qty" int not null,
"status" boolean not null default true,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);
-- Create table order
create table if not exists "order"(
"id" serial primary key,
"user_id" int not null,
foreign key (user_id) references users(id),
"product_id" int not null,
foreign key (product_id) references product(id),
"promo_id" int null,
foreign key (promo_id) references promo(id),
"date_order" date not null not null,
"qty" int not null not null,
"status_order" int not null,
"noted" text,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);


-- CRUD Table Users
INSERT INTO "users"
(id, "name", "level", "images", "phone", "alamat", "email", "password", "createdAt", "updatedAt")
VALUES(1, 'gabriel', 'user', '1.jpg', '085155556666', 'Bekasi', 'puragmahk@gmail.com', 'putra123', '2023-11-06 21:18:37.109', NULL);

UPDATE "users"
SET "name"='gabriel', "role"='user', "images"='', "phone"='0808080089832', "alamat"='Bekasi', "email"='puragmahk@gmail.com', "password"='putra123', "createdAt"='2023-11-06 21:18:37.109', "updatedAt"=NULL
WHERE "id"=1;

DELETE FROM "users" WHERE "id"=1;

SELECT * FROM "users"



-- CRUD Table Product
INSERT INTO "product" ("id", "name_product", "images", "desk_product", "qty", "status", "createdAt", "updatedAt")
VALUES(1, 'kopi susu', 'kopi-susu.png', NULL, 5, true, '2023-11-06 21:31:19.938', NULL);

UPDATE "product" SET "name_product"='kopi susu', "images"='kopi-susu.png', "desk_product"=NULL, "qty"=5, "status"=true, "createdAt"='2023-11-06 21:31:19.938', "updatedAt"=NULL
WHERE "id"=1;

DELETE FROM "product" WHERE "id"=1;

SELECT * FROM "product"


-- CRUD Table Promo
INSERT INTO "promo" ("id", "code", "images", "min_order", "max_discount", "percent", "description", "qty", "status", "createdAt", "updatedAt")
VALUES(1, 'FAZZFOOD50', 'promo.png', 50000, 50000, 0.5, NULL, 100, true, '2023-11-06 22:13:56.332', NULL);

UPDATE "promo" SET "code"='FAZZFOOD50', "images"='promo.png', "min_order"=50000, "max_discount"=50000, "percent"=0.5, "description"=NULL, "qty"=100, "status"=true, "createdAt"='2023-11-06 22:13:56.332', "updatedAt"=NULL
WHERE "id"=1;

DELETE FROM "promo" WHERE "id"=1;

SELECT * FROM "promo"


-- CRUD Table Order
INSERT INTO "order" ("id", "user_id", "product_id", "promo_id", "date_order", "qty", "status_order", "noted", "createdAt", "updatedAt")
VALUES(2, 1, 1, 1, '2023-11-06', 2, 1, 'siap bos kuu.', '2023-11-06 22:17:47.144', NULL);

UPDATE "order" SET "user_id"=1, "product_id"=1, "promo_id"=1, "date_order"='2023-11-06', "qty"=2, "status_order"=1, "noted"='siap bos kuu.', "createdAt"='2023-11-06 22:17:47.144', "updatedAt"=NULL
WHERE "id"=2;

DELETE FROM "order" WHERE "id"=2;

SELECT * FROM "order"


-- penggunaan ALTER untuk menambahkan column baru lagi
alter table "product" add column "price" decimal not null

-- penggunaan ALTER untuk mengganti nama column
alter table "product" rename column "desc_product" to "description"

-- penggunaan ALTER untuk ganti tipe dari column
alter table "product" alter column "description" type varchar(255)

-- penggunaan ALTER untuk drop column
alter table "users" drop column "gender"

-- penggunaan ALTER untuk seting foreign key di suatu column
alter table order 
add constraint product_id 
foreign key (fk_product) 
references product (id);

-- latihan dengan menggunakan inner join
select "u"."name", "p"."name", "pr"."code", "o"."qty", "o"."date_order" from "order" "o" 
inner join "users" "u" on "u"."id" = "o"."user_id" 
inner join "product" "p" on "p"."id" = "o"."product_id"
inner join "promo" "pr" on "pr"."id" = "o"."promo_id"