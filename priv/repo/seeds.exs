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
alias CateringApp.Events.Event
alias CateringApp.Menus.Menu

admin = Repo.insert!(%User{username: "admin", password_hash: hash, admin: true, is_caterer: false, bio: "The admin user."})
caterer = Repo.insert!(%User{username: "Caterer A", password_hash: hash, admin: false, is_caterer: true, bio: "A sample caterer."})
event = Repo.insert!(%Event{name: "Event A", day: ~D[2020-01-01], approved: false, client: admin, caterer: caterer})
Repo.insert!(%Menu{event: event, preferences: "", feedback: "", dish1: "Chicken Tikka Marsala", dish2: "Cheese Fondue", dish3: "Puttanesca Pasta", dish4: "Grilled Salmon", dish5: "Chocolate Cake"})
