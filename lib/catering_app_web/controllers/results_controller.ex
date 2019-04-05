defmodule CateringAppWeb.ResultsController do
  use CateringAppWeb, :controller
  def index(conn, %{"prefs" => prefs}) do
    http_prefs = String.replace(prefs, " ", "%20")
#    results = HTTPoison.get("https://www.food2fork.com/api/search?key=d6203ad14cc7132eb562d765899b7d1d&q=" <> http_prefs)
    results = {:ok, %{
   "count" => 30,
   "recipes" => [
     %{
       "f2f_url" => "http://food2fork.com/view/35120",
       "image_url" => "http://static.food2fork.com/Bacon2BWrapped2BJalapeno2BPopper2BStuffed2BChicken2B5002B5909939b0e65.jpg",
       "publisher" => "Closet Cooking",
       "publisher_url" => "http://closetcooking.com",
       "recipe_id" => "35120",
       "social_rank" => 100.0,
       "source_url" => "http://www.closetcooking.com/2012/11/bacon-wrapped-jalapeno-popper-stuffed.html",
       "title" => "Bacon Wrapped Jalapeno Popper Stuffed Chicken"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/47194",
       "image_url" => "http://static.food2fork.com/4024225151_5f477f16caabf9.jpg",
       "publisher" => "The Pioneer Woman",
       "publisher_url" => "http://thepioneerwoman.com",
       "recipe_id" => "47194",
       "social_rank" => 100.0,
       "source_url" => "http://thepioneerwoman.com/cooking/2009/10/chicken-parmigiana/",
       "title" => "Chicken Parmigiana"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35169",
       "image_url" => "http://static.food2fork.com/Buffalo2BChicken2BChowder2B5002B0075c131caa8.jpg",
       "publisher" => "Closet Cooking",
       "publisher_url" => "http://closetcooking.com",
       "recipe_id" => "35169",
       "social_rank" => 100.0,
       "source_url" => "http://www.closetcooking.com/2011/11/buffalo-chicken-chowder.html",
       "title" => "Buffalo Chicken Chowder"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/0c2e90",
       "image_url" => "http://static.food2fork.com/205xNxchickenandspinachflautas2296f.jpg.pagespeed.ic.RNEW9wsRU.jpg",
       "publisher" => "Healthy Delicious",
       "publisher_url" => "http://www.healthy-delicious.com",
       "recipe_id" => "0c2e90",
       "social_rank" => 100.0,
       "source_url" => "http://www.healthy-delicious.com/2012/03/baked-chicken-and-spinach-flautas/",
       "title" => "Baked Chicken and Spinach Flautas"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/46982",
       "image_url" => "http://static.food2fork.com/broccolicf92.jpg",
       "publisher" => "The Pioneer Woman",
       "publisher_url" => "http://thepioneerwoman.com",
       "recipe_id" => "46982",
       "social_rank" => 99.99999999999993,
       "source_url" => "http://thepioneerwoman.com/cooking/2011/11/broccoli-cheese-soup/",
       "title" => "Broccoli Cheese Soup"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/47264",
       "image_url" => "http://static.food2fork.com/3214830317_3470607769fad0.jpg",
       "publisher" => "The Pioneer Woman",
       "publisher_url" => "http://thepioneerwoman.com",
       "recipe_id" => "47264",
       "social_rank" => 99.99999999999457,
       "source_url" => "http://thepioneerwoman.com/cooking/2009/01/ranch-style-chicken/",
       "title" => "Ranch Style Chicken"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35168",
       "image_url" => "http://static.food2fork.com/Buffalo2BChicken2BChili2B5002B9548b7d71737.jpg",
       "publisher" => "Closet Cooking",
       "publisher_url" => "http://closetcooking.com",
       "recipe_id" => "35168",
       "social_rank" => 99.99999999999191,
       "source_url" => "http://www.closetcooking.com/2012/04/buffalo-chicken-chili.html",
       "title" => "Buffalo Chicken Chili"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/9eb23b",
       "image_url" => "http://static.food2fork.com/CheddarJalapenoChickenBurgerswithGuacamole4fdb.jpg",
       "publisher" => "What's Gaby Cooking",
       "publisher_url" => "http://whatsgabycooking.com",
       "recipe_id" => "9eb23b",
       "social_rank" => 99.99999999998766,
       "source_url" => "http://whatsgabycooking.com/cheddar-jalapeno-chicken-burgers-with-guacamole/",
       "title" => "Cheddar Jalapeno Chicken Burgers with Guacamole"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/14238",
       "image_url" => "http://static.food2fork.com/26754716e.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "14238",
       "social_rank" => 99.99999999783395,
       "source_url" => "http://allrecipes.com/Recipe/Garlic-Cheddar-Chicken/Detail.aspx",
       "title" => "Garlic Cheddar Chicken"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/5053",
       "image_url" => "http://static.food2fork.com/703537dd3.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "5053",
       "social_rank" => 99.99999999350105,
       "source_url" => "http://allrecipes.com/Recipe/Buffalo-Chicken-Dip/Detail.aspx",
       "title" => "Five-Star Buffalo Chicken Dip"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/46873",
       "image_url" => "http://static.food2fork.com/sliders9dc7.jpg",
       "publisher" => "The Pioneer Woman",
       "publisher_url" => "http://thepioneerwoman.com",
       "recipe_id" => "46873",
       "social_rank" => 99.99999997593618,
       "source_url" => "http://thepioneerwoman.com/cooking/2013/01/grilled-chicken-bacon-sliders/",
       "title" => "Grilled Chicken Bacon Sliders"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/27464",
       "image_url" => "http://static.food2fork.com/6848617ef9.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "27464",
       "social_rank" => 99.99999997001449,
       "source_url" => "http://allrecipes.com/Recipe/Salsa-Chicken-Rice-Casserole/Detail.aspx",
       "title" => "Salsa Chicken Rice Casserole"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35697",
       "image_url" => "http://static.food2fork.com/angelhairpastalemonshrimpa300x200c63d5dd4.jpg",
       "publisher" => "Simply Recipes",
       "publisher_url" => "http://simplyrecipes.com",
       "recipe_id" => "35697",
       "social_rank" => 99.99999996218132,
       "source_url" => "http://www.simplyrecipes.com/recipes/angel_hair_pasta_with_shrimp_and_lemon_cream_sauce/",
       "title" => "Angel Hair Pasta with Shrimp and Lemon Cream Sauce"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35858",
       "image_url" => "http://static.food2fork.com/buffalowingsa300x20003882731.jpg",
       "publisher" => "Simply Recipes",
       "publisher_url" => "http://simplyrecipes.com",
       "recipe_id" => "35858",
       "social_rank" => 99.99999993586518,
       "source_url" => "http://www.simplyrecipes.com/recipes/buffalo_wings/",
       "title" => "Buffalo Wings"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/34375",
       "image_url" => "http://static.food2fork.com/28752004fa.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "34375",
       "social_rank" => 99.99999974384113,
       "source_url" => "http://allrecipes.com/Recipe/White-Cheese-Chicken-Lasagna/Detail.aspx",
       "title" => "White Cheese Chicken Lasagna"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35214",
       "image_url" => "http://static.food2fork.com/Chicken2Band2BAvocado2BEnchiladas2Bin2BCreamy2BAvocado2BSauce2B5002B121944fe0661.jpg",
       "publisher" => "Closet Cooking",
       "publisher_url" => "http://closetcooking.com",
       "recipe_id" => "35214",
       "social_rank" => 99.99999971701476,
       "source_url" => "http://www.closetcooking.com/2012/09/chicken-and-avocado-enchiladas-in.html",
       "title" => "Chicken and Avocado Enchiladas in Creamy Avocado Sauce"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/2480",
       "image_url" => "http://static.food2fork.com/6184894a21.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "2480",
       "social_rank" => 99.99999968477916,
       "source_url" => "http://allrecipes.com/Recipe/Baked-Garlic-Parmesan-Chicken/Detail.aspx",
       "title" => "Baked Garlic Parmesan Chicken"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/7202",
       "image_url" => "http://static.food2fork.com/214411de5a.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "7202",
       "social_rank" => 99.9999995711024,
       "source_url" => "http://allrecipes.com/Recipe/Chicken-Fettuccini-Alfredo/Detail.aspx",
       "title" => "Chicken Fettuccini Alfredo"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/47039",
       "image_url" => "http://static.food2fork.com/tacos638b.jpg",
       "publisher" => "The Pioneer Woman",
       "publisher_url" => "http://thepioneerwoman.com",
       "recipe_id" => "47039",
       "social_rank" => 99.99999940961811,
       "source_url" => "http://thepioneerwoman.com/cooking/2011/03/my-brothers-chicken-tacos/",
       "title" => "My Brother’s Chicken Tacos"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35949",
       "image_url" => "http://static.food2fork.com/chickenparma300x20058014b23.jpg",
       "publisher" => "Simply Recipes",
       "publisher_url" => "http://simplyrecipes.com",
       "recipe_id" => "35949",
       "social_rank" => 99.99999940447204,
       "source_url" => "http://www.simplyrecipes.com/recipes/chicken_parmesan/",
       "title" => "Chicken Parmesan"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/36794",
       "image_url" => "http://static.food2fork.com/quesadillas300x2009e105aa7.jpg",
       "publisher" => "Simply Recipes",
       "publisher_url" => "http://simplyrecipes.com",
       "recipe_id" => "36794",
       "social_rank" => 99.99999939665845,
       "source_url" => "http://www.simplyrecipes.com/recipes/quesadilla/",
       "title" => "Quesadilla"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/6260",
       "image_url" => "http://static.food2fork.com/631578cc71.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "6260",
       "social_rank" => 99.99999929324416,
       "source_url" => "http://allrecipes.com/Recipe/Cha-Chas-White-Chicken-Chili/Detail.aspx",
       "title" => "Cha Cha's White Chicken Chili"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/3029fb",
       "image_url" => "http://static.food2fork.com/205xNxIMG_9952d171.jpg.pagespeed.ic.czLaT9LOmD.jpg",
       "publisher" => "Healthy Delicious",
       "publisher_url" => "http://www.healthy-delicious.com",
       "recipe_id" => "3029fb",
       "social_rank" => 99.99999999981448,
       "source_url" => "http://www.healthy-delicious.com/2010/05/taco-bake/",
       "title" => "Taco Casserole"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/11975",
       "image_url" => "http://static.food2fork.com/892012a7e7.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "11975",
       "social_rank" => 99.99999708831464,
       "source_url" => "http://allrecipes.com/Recipe/Easy-Chicken-Taquitos/Detail.aspx",
       "title" => "Easy Chicken Taquitos"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/7348",
       "image_url" => "http://static.food2fork.com/10037355f.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "7348",
       "social_rank" => 99.99999651834585,
       "source_url" => "http://allrecipes.com/Recipe/Chicken-Parmigiana/Detail.aspx",
       "title" => "Chicken Parmigiana"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/7186",
       "image_url" => "http://static.food2fork.com/3069645b08.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "7186",
       "social_rank" => 99.99999190733067,
       "source_url" => "http://allrecipes.com/Recipe/Chicken-Enchiladas-I/Detail.aspx",
       "title" => "Chicken Enchiladas I"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/27461",
       "image_url" => "http://static.food2fork.com/92740223f.jpg",
       "publisher" => "All Recipes",
       "publisher_url" => "http://allrecipes.com",
       "recipe_id" => "27461",
       "social_rank" => 99.99999134830489,
       "source_url" => "http://allrecipes.com/Recipe/Salsa-Chicken/Detail.aspx",
       "title" => "Salsa Chicken"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/21997b",
       "image_url" => "http://static.food2fork.com/30343_Recipeimage_620x413_parmesan_chicken_meatloaf_muffins210f0.jpg",
       "publisher" => "Chow",
       "publisher_url" => "http://www.chow.com",
       "recipe_id" => "21997b",
       "social_rank" => 99.99997780651982,
       "source_url" => "http://www.chow.com/recipes/30343-chicken-parmesan-meatloaf-muffins",
       "title" => "Chicken Parmesan Meatloaf Muffins Recipe"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/35170",
       "image_url" => "http://static.food2fork.com/Buffalo2BChicken2BClub2BSandwich2B5002B266015113834.jpg",
       "publisher" => "Closet Cooking",
       "publisher_url" => "http://closetcooking.com",
       "recipe_id" => "35170",
       "social_rank" => 99.9999772451553,
       "source_url" => "http://www.closetcooking.com/2012/03/buffalo-chicken-club-sandwich.html",
       "title" => "Buffalo Chicken Club Sandwich"
     },
     %{
       "f2f_url" => "http://food2fork.com/view/47052",
       "image_url" => "http://static.food2fork.com/5465969485_ba49f4620b_oce16.jpg",
       "publisher" => "The Pioneer Woman",
       "publisher_url" => "http://thepioneerwoman.com",
       "recipe_id" => "47052",
       "social_rank" => 99.99997636219736,
       "source_url" => "http://thepioneerwoman.com/cooking/2011/02/creamy-chicken-spaghetti-casserole/",
       "title" => "Creamy Chicken Spaghetti Casserole"
     }
   ]
 }}
#    decResults = Poison.decode(elem(results, 1).body)
    listResults = results |> elem(1) |> Map.fetch("recipes") |> elem(1)
    render(conn, "index.html", prefs: prefs, results: listResults)
  end
end
