CREATE TABLE cats (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER,

  FOREIGN KEY(owner_id) REFERENCES human(id)
);

CREATE TABLE superhumans (
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
  (1, "Batcave, Gotman City"),
  (2, "West House, Century City"),
  (3, "Fortress of Solitude, Arctic"),
  (4, "Edwards Air Force Base, Coast City");

INSERT INTO
  superhumans (id, fname, lname, house_id)
VALUES
  (1, "Bruce", "Wayne", 1),
  (2, "Barry", "Allen", 1),
  (3, "Clark", "Kent", 2),
  (4, "Hal", "Jordan", NULL);

INSERT INTO
  cats (id, name, owner_id)
VALUES
  (1, "King James", 1),
  (2, "Uncle Drew", 2),
  (3, "Durantula", 3),
  (4, "Chef Curry", 3),
  (5, "Boogie", NULL);
