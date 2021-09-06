-- users
CREATE TABLE users (
	user_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	username varchar(50) NOT NULL,
	"password" text NOT NULL,
	email varchar(255) NOT NULL,
	created_on timestamp NULL,
	CONSTRAINT users_email_key UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (user_id),
	CONSTRAINT users_username_key UNIQUE (username)
);

-- campaigns
CREATE TABLE campaigns (
	campaign_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	campaign_owner_id uuid NULL,
	campaign_title text NOT NULL,
	campaign_desc text NULL,
	created_at timestamp NULL,
	CONSTRAINT campaigns_pkey PRIMARY KEY (campaign_id)
);
ALTER TABLE public.campaigns ADD CONSTRAINT campaigns_campaign_owner_id_fkey FOREIGN KEY (campaign_owner_id) REFERENCES users(user_id) ON DELETE CASCADE;


-- donations
CREATE TABLE donations (
	donation_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	campaign_id uuid NULL,
	user_id uuid NULL,
	item_name text NOT NULL,
	item_quantity int4 NOT NULL,
	delivery_date text NOT NULL,
	delivery_location text NOT NULL,
	CONSTRAINT donations_pkey PRIMARY KEY (donation_id)
);
ALTER TABLE public.donations ADD CONSTRAINT donations_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON DELETE CASCADE;
ALTER TABLE public.donations ADD CONSTRAINT donations_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE;