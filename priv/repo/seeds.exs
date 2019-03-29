# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CateringApp.Repo.insert!(%CateringApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

hash = Argon2.hash_pwd_salt("password")

alias CateringApp.Repo
alias CateringApp.Users.User

Repo.insert!(%User{username: "admin", password_hash: hash, admin: true, is_caterer: false, bio: "The admin user."})
