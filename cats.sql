CREATE TABLE cats (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER,

  FOREIGN KEY(owner_id) REFERENCES human(id)
);

CREATE TABLE humans (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  house_id INTEGER,

  FOREIGN KEY(house_id) REFERENCES human(id)
);

CREATE TABLE houses (
  id INTEGER PRIMARY KEY,
  address VARCHAR(255) NOT NULL
);

INSERT INTO
  houses (id, address)
VALUES
  (1, "26th and Guerrero"), (2, "Dolores and Market");

INSERT INTO
  humans (id, fname, lname, house_id)
VALUES
  (1, "Bruce", "Wayne", 1),
  (2, "Barry", "Allen", 1),
  (3, "Clark", "Kent", 2),
  (4, "Torch", "Human", NULL);

INSERT INTO
  cats (id, name, owner_id)
VALUES
  (1, "Durantula", 1),
  (2, "Linsanity", 2),
  (3, "LeBron", 3),
  (4, "Shaq", 3),
  (5, "His Airness", NULL);
