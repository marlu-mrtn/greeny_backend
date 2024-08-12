-- Deploy greeny_database:01_init to pg

BEGIN;

CREATE TABLE "user" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "username" text NOT NULL UNIQUE,
    "email"  text NOT NULL UNIQUE,
    "password" text NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz
);

CREATE TABLE "plant" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" text NOT NULL UNIQUE,
    "size" decimal,
    "picture" text[],
    "watered" boolean,
    "fed" boolean,
    "user_id" int NOT NULL REFERENCES "user"("id") ON DELETE CASCADE,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz
);
COMMIT;
