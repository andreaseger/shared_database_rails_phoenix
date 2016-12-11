shared databases between rails and phoenix
===

Quick test to see how to share a database between rails and phoenix.
(Although to keep sane only one of them should be allowed to make schema chnages)

Prerequirements
---

- postgresql with database `shared_users_dev`
- ruby (i.e. mri 2.3.3)
- elixir (i.e. 1.4)

Howto
---


Intall rails and create some users via rails

```sh
cd rb_users
bundle
bin/rake db:migrate
bin/rake db:seed
```

Now there should be 4 users in the database created via rails (including timestamps).
Lets setup the phoenix app and see if we can correctly read them.

```sh
cd ../ex_users
mix deps.get
mix phoenix.server
curl localhost:4000/api/users
curl localhost:4000/api/users/1
```

And just like that we should get the user data via phoenix

To Pay attention
---

Only create migrations in one of the two apps if the tables are going to be shared (probably
stick with rails as that is less flexible)

For phoenix/ecto models make sure to adapt the `timestamps` function inside the schema definition
to mirror the rails/active_record column naming
-> `timestamps(inserted_at: :created_at, updated_at: :updated_at)`
