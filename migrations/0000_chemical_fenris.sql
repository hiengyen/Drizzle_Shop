CREATE TABLE IF NOT EXISTS "Keys" (
	"id" serial PRIMARY KEY NOT NULL,
	"user_id" serial NOT NULL,
	"privateKey" text NOT NULL,
	"publicKey" text NOT NULL,
	"created_at" timestamp DEFAULT now(),
	"updated_at" timestamp DEFAULT now()
);

CREATE TABLE IF NOT EXISTS "Users" (
	"id" serial PRIMARY KEY NOT NULL,
	"phone_number" varchar(10) NOT NULL,
	"email" varchar(256) NOT NULL,
	"name" varchar(150) NOT NULL,
	"password" varchar(255) NOT NULL,
	"role" varchar(30) NOT NULL,
	"created_at" timestamp DEFAULT now(),
	"updated_at" timestamp DEFAULT now()
);

DO $$ BEGIN
 ALTER TABLE "Keys" ADD CONSTRAINT "Keys_user_id_Users_id_fk" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
