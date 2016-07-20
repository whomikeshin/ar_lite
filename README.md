#AR-Lite
AR-Lite is a lightweight ORM, based on ActiveRecord, that translates between Ruby objects and SQL queries.

##How to Use
* Clone the repo and include lib in your rails db folder
* Update the db and sql files with a sqlite3 db in db_connection.rb
* Create new model, inherit from SQLObject, and invoke finalize!

```
require 'sql_object'

class Model < SQLObject
  Model.finalize!
  ...
end
```

* Use core methods to make appropriate queries

##Core Methods
* ::all
* ::find
* ::where
* #insert
* #update
* #save
* #destroy

##Associations
* belongs_to(name, options)
* has_many(name, options)
* has_one_through(name, through_name, source_name)
