/* Database schema to keep the structure of entire database. */
-- to create the database: createdb catalog_of_stuff

--Label
CREATE TABLE label(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100)
);

--Author
CREATE TABLE author(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

-- Book
CREATE TABLE book(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  publisher VARCHAR(100),
  cover_state VARCHAR(4),
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE
);

--Item
CREATE TABLE item (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Game
CREATE TABLE game(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  publish_date DATE,
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE
);
