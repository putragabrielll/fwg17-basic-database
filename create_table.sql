create table if not exists "users"(
"id" serial primary key,
"name" varchar (255) unique not null,
"level" varchar (5) not null default 'user',
"images" varchar (255),
"phone" varchar (15) not null,
"alamat" varchar (255) not null,
"email" varchar (50) unique not null,
"password" varchar (255) not null,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

create table if not exists "product"(
"id" serial primary key,
"name_product" varchar (255) not null,
"images" varchar (255),
"desk_product" text,
"qty" int not null,
"status" smallint not null,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

create table if not exists "promo"(
"id" serial primary key,
"nama_promo" varchar(20) not null,
"images" varchar(255),
"desk_product" text,
"jumlah_promo" int not null,
"status" smallint not null,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);

create table if not exists "order"(
"id" serial primary key,
"user_id" int not null,
foreign key (user_id) references users(id),
"product_id" int not null,
foreign key (product_id) references product(id),
"promo_id" int not null,
foreign key (promo_id) references promo(id),
"tgl_order" date not null not null,
"jumlah_product" int not null not null,
"status_order" int not null,
"noted" text,
"createdAt" timestamp default now(),
"updatedAt" timestamp 
);