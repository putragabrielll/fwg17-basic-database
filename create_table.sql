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