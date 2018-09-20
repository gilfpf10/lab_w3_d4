require_relative("../db/sql_runner")

class Movie

  attr_accessor :title, :genre
  attr_reader :id


  def initialize(options)

    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
  end

  def save

    sql = "INSERT INTO movies
    (
      title,
      genre
    )
    VALUES
    ($1,$2)
    RETURNING id"
    values = [@title, @genre]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def Movie.delete_all
    sql ="DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def all_stars()
    # calling everything from stars
    #joinning stars to castings
    # joinning stars to castings based on movie_id
    sql = "SELECT stars.* from stars
    INNER JOIN castings
    ON stars.id = star_id
    WHERE movie_id = $1"
    values = [@id]
    star =SqlRunner.run(sql, values)
    return star.map{|star_data| Star.new(star_data)}
    end

  end
