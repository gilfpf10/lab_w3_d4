require_relative("models/movie")
require_relative("models/star")
require_relative("models/casting")

require("pry-byebug")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({"title" => "scream", "genre" => "horror"})
movie1.save
movie2 = Movie.new({"title" => "scream2", "genre" => "horror"})
movie2.save

star1 = Star.new({"first_name" => "john", "last_name" => "smith" })
star1.save
star2 = Star.new({"first_name" => "Jane", "last_name" => "Jones"})
star2.save

casting1 = Casting.new({"fee" => 500,"movie_id" => movie1.id, "star_id" => star1.id})
casting1.save
casting2 = Casting.new({"fee" => 600,"movie_id" => movie2.id, "star_id" => star2.id})
casting2.save

binding.pry
nil
