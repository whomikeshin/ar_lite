#ARMOR
Armor is a lightweight ORM, based on ActiveRecord, that links Ruby objects and SQL records, using modules and inheritance.

##How to Use
* Use SQLite database for project.
* Install `sqlite3` gem.
* Clone the repo and include lib in rails db folder.
* Update `CATS_DB_FILE` and `CATS_SQL_FILE` in db_connection.rb to correct file paths.
* Create new model, inherit from SQLObject class, and invoke finalize!

```
require 'sql_object'

class Villian < SQLObject
  has_many :enemies, foreign_key: :enemy_id
  self.finalize!
  ...
end
```

* Use methods to make necessary queries or associations.

##Core Methods
* `all` - returns an array of objects for each row in database
* `find(id)` - returns a SQLObject corresponding to primary key
* `where(params)` - takes a params hash as argument and returns an array of objects that match specified params

```
Cat.where( {name: 'Alfred'} ) #=> Cat name 'King James'
```

* `insert` - insert new row in into table that represents object and assigns id
* `update` - updates corresponding row of table
* `save` - invokes insert or update if record exists
* `destroy` - deletes object's row from table corresponding to primary key

##Associations
* `belongs_to(name, options)` - sets up connection that will return a single associated object

```
def belongs_to(name, options = {})
  assoc_options[name] = BelongsToOptions.new(name, options)

  define_method(name) do
    options = self.class.assoc_options[name]
    key_value = self.send(options.foreign_key)
    options.model_class.where(id: key_value).first
  end
end
```

* `has_many(name, options)` - sets up connection that will return associated objects

```
def has_many(name, options = {})
  assoc_options[name] = HasManyOptions.new(name, self.name, options)

  define_method(name) do
    options = self.class.assoc_options[name]
    fkey = options.foreign_key.to_sym
    options.model_class.where("#{fkey}".to_sym => self.id)
  end
end
```

* `has_one_through(name, through_name, source_name)` - sets up connection through other tables that will return associated object

##Demo
* Clone the repo
* Navigate to `irb` or `pry`
* `load 'demo.rb'` in command line
* Enter `a = Cat.find(1)`
* Test associations
* Create new cat

```ruby
[1] pry(main)> load 'demo.rb'
=> true
[2] pry(main)> Cat.all
=> [#<Cat:0x007f97fa44d100 @attributes={:id=>1, :name=>"Catman", :owner_id=>1}>,
 #<Cat:0x007f97fa44cf98 @attributes={:id=>2, :name=>"Supercat", :owner_id=>3}>,
 #<Cat:0x007f97fa44ccc8 @attributes={:id=>3, :name=>"Kat-El", :owner_id=>3}>,
 #<Cat:0x007f97fa44ca98 @attributes={:id=>4, :name=>"Wondercat", :owner_id=>5}>,
 #<Cat:0x007f97fa44c818 @attributes={:id=>5, :name=>"Aquacat", :owner_id=>nil}>]
[3] pry(main)> a = Cat.find(1)
=> #<Cat:0x007f97fc942988 @attributes={:id=>1, :name=>"Catman", :owner_id=>1}>
[4] pry(main)> a.superhero
=> #<Superhero:0x007f97fcfacfd0
 @attributes={:id=>1, :fname=>"Bruce", :lname=>"Wayne", :house_id=>1}>
[5] pry(main)> a.house
=> #<House:0x007f97fce791b8 @attributes={:id=>1, :address=>"Wayne Manor, Gotman City"}>
[6] pry(main)> b = Cat.new(name: "Fastcat", owner_id: 2)
=> #<Cat:0x007f97fcd4f148 @attributes={:name=>"Fastcat", :owner_id=>2}>
[7] pry(main)> b.save
=> 6
```
