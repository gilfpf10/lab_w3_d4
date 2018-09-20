DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;

CREATE TABLE stars(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
CREATE TABLE movies(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);
CREATE TABLE castings(
  id SERIAL4 PRIMARY KEY,
  movies_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  stars_id INT4 REEFRENCES stars(id) ON DELETE CASCADE,
  fee INT4
);
