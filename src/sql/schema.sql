/* Database schema to keep the structure of entire database. */
-- to create the database: createdb catalog_of_stuff

-- Book
CREATE TABLE book(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date VARCHAR(100),
  publisher DATE,
  cover_state VARCHAR(4),
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY(label_id) references label(id) ON DELETE SET NULL ON UPDATE CASCADE
);
