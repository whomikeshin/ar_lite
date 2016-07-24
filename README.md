#ARQ
ARQ is a lightweight ORM, based on ActiveRecord, that translates between Ruby objects and SQL records using modules and inheritance.

##How to Use
* Use SQLite database and install `sqlite3` gem.
* Clone the repo and include lib in rails db folder.
* Update `TEST_DB_FILE` and `TEST_SQL_FILE` in db_connection.rb file.
* Create new model, inherit from SQLObject class, and invoke finalize!

```
require 'sql_object'

class Model < SQLObject
  Model.finalize!
  ...
end
```

* Use methods to make appropriate queries or associations

##Core Methods
* `all` - returns an array of objects for each row in corresponding table
* `find(id)` - returns a SQLObject corresponding to primary key
* `where(params)` - takes a params hash as argument and returns an array of objects that match specified params

```
Cat.where( {name: 'King James'} ) #=> Cat name 'King James'
```

* `insert` - insert new row in into table that represents object and assigns id
* `update` - updates corresponding row of table
* `save` - invokes insert or update if record exists
* `destroy` - deletes object's row from table corresponding to primary key

##Associations
* `belongs_to(name, options)` - sets up connection that will return a single associated object
* `has_many(name, options)` - sets up connection that will return associated objects
* `has_one_through(name, through_name, source_name)` - sets up connection through other tables that will return associated object
