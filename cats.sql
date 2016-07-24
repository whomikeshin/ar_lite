CREATE TABLE cats (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER,

  FOREIGN KEY(owner_id) REFERENCES human(id)
);

CREATE TABLE superheroes (
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
  (1, "Wayne Manor, Gotman City"),
  (2, "West House, Century City"),
  (3, "Daily Planet, Metropolis"),
  (4, "Atlantean Royal Palace, Atlantis");

INSERT INTO
  superheroes (id, fname, lname, house_id)
VALUES
  (1, "Bruce", "Wayne", 1),
  (2, "Barry", "Allen", 2),
  (3, "Clark", "Kent", 3),
  (4, "Diana", "Prince", NULL),
  (5, "Arthur", "Curry", 5);

INSERT INTO
  cats (id, name, owner_id)
VALUES
  (1, "Catman", 1),
  (2, "Supercat", 3),
  (3, "Kat-El", 3),
  (4, "Wondercat", 5),
  (5, "Aquacat", NULL);
