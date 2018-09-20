require_relative("../db/sql_runner")


class Star

  attr_accessor :first_name, :last_name
  attr_reader :id


  def initialize(options)

    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save

    sql = "INSERT INTO stars
    (
      first_name,
      last_name
    )
    VALUES
    ($1,$2)
    RETURNING id"
    values = [@first_name, @last_name]
    stars = SqlRunner.run( sql, values ).first
    @id = stars['id'].to_i
  end

  def Star.delete_all
    sql ="DELETE FROM stars"
    SqlRunner.run(sql)
  end


end
