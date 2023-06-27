CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar(20),
  "email" varchar(255)
);

CREATE TABLE "details" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "favorite_ice_cream" varchar(50)
);

CREATE TABLE "interests" (
  "id" integer PRIMARY KEY,
  "name" varchar(50)
);

CREATE TABLE "followers" (
  "id" integer PRIMARY KEY,
  "following_user_id" integer
);

CREATE TABLE "following" (
  "id" integer PRIMARY KEY,
  "followed_by_user_id" integer
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "body" text
);

ALTER TABLE "followers" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "following" ADD FOREIGN KEY ("followed_by_user_id") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "details" ("id");

CREATE TABLE "users_interests" (
  "users_id" integer,
  "interests_id" integer,
  PRIMARY KEY ("users_id", "interests_id")
);

ALTER TABLE "users_interests" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_interests" ADD FOREIGN KEY ("interests_id") REFERENCES "interests" ("id");

