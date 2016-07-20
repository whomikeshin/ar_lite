#AR-Lite
AR-Lite is a lightweight ORM, based on ActiveRecord, that converts between Ruby objects and SQL queries

##How to Use
* Clone/download the repo and include lib in rails db folder
* Update DB and SQL files in db_connection.rb
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
* `all` - fetches all records from database and returns array of objects for each row
* `find` - returns single object corresponding to primary key
* `where` - takes a params hash and returns an array of objects that match specified params

```

```

* `insert` - insert new row in into table that represents model
* `update` - updates row of table
* `save` - invokes insert or update if record exists
* `destroy` - deletes row from table corresponding to primary key

##Associations
Sets up connection that will fetch a single associated record
* belongs_to(name, options)
* has_many(name, options)
* has_one_through(name, through_name, source_name)
