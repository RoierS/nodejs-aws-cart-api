create table carts (
	id uuid not null default uuid_generate_v4() primary key,
    user_id uuid not null,
    created_at timestamp not null default now(),
    updated_at timestamp not null default now(),
    status varchar(10) default 'OPEN' check (status in ('OPEN', 'ORDERED'))
);

create table cart_items (
  cart_id uuid references carts(id) primary key,
  product_id uuid,
  count integer
);


create table users (
	id uuid primary key,
	name varchar(100),
	email varchar(100)
)

create table orders (
    id uuid primary key,
    user_id uuid references users(id),
    cart_id uuid references carts(id),
    payment json,
    delivery json,
    comments text,
    status varchar(20),
    total numeric
);
