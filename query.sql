create type account_roll as enum('ADMIN', 'USER');
create type invoice_status as enum('NEW', 'SHIPPING', 'DONE', 'ABORT');
create type payment_method as enum('COD', 'BANKING');

//drop type invoicestatus;
//drop type paymentmethod;
//drop type accountroll;

create table provider (
  provider_id text primary key,
  provider_name text not null
);

create table category (
  category_id text primary key,
  category_value text not null
);

create table store (
  store_id text primary key,
  store_name text not null,
  description text,
  address text,
  phonr_number text,
  email text,
  fb_url text,
  banner_url text[]
);

create table attribute_type (
  type_id text primary key,
  type_value text not null
);

create table account (
  account_id text primary key,
  account_name text not null,
  avt text,
  phone_number text,
  create_at timestamp(3),
  edited_at timestamp(3),
  is_banned boolean default(false),
  email text not null,
  passwd text not null,
  refresh_token text not null,
  refresh_token_used text[],
  roll account_roll not null
);

create table product (
  product_id text primary key,
  product_name text not null,
  description text,
  height text not null,
  weight text not null,
  len text not null,
  width text not null,
  gurantee text not null,
  category_id text not null references category(category_id),
  provider_id text not null references provider(provider_id)
);

create table product_item (
  item_id text primary key,
  thump text not null,
  quantity integer not null,
  price float not null,
  id_prior boolean not null,
  product_code text unique,
  discount float,
  created_at timestamp(3),
  editted_at timestamp(3),
  color_id text not null,
  storage_id text,
  product_id text not null references product(product_id)
);

create table attribute_option (
  option_id text primary key,
  option_value text not null,
  type_id text not null references attribute_type(type_id)
);

create table product_attribute (
  product_id text not null references product(product_id),
  option_id text not null references attribute_option(option_id)
);

create table product_image (
  image_id text primary key,
  src text not null,
  item_id text not null references product_item(item_id)
);

create table review (
  review_id text primary key,
  review_content text not null,
  rating integer default(5),
  created_at timestamp(3) default current_timestamp,
  product_id text not null references product(product_id),
  account_id text not null references account(account_id)
);

create table invoice (
  invoice_id text primary key,
  status invoice_status not null,
  payment payment_method not null,
  city text not null,
  ward text not null,
  province text not null,
  phone_number text not null,
  detail_address text not null,
  created_at timestamp(3) default current_timestamp,
  editted_at timestamp(3),
  account_id text not null references account(account_id)
);

create table invoice_product (
  discount float,
  price float not null,
  quantity integer not null,
  invoice_id text references invoice(invoice_id),
  product_id text references product(product_id)
);

create table slide_show (
  slide_id text primary key,
  url text not null,
  alt text not null,
  store_id text not null references store(store_id)
);
