#ARMOR
Armor is a lightweight ORM, based on ActiveRecord, that links Ruby objects and SQL records, using modules and inheritance.

##How to Use
* Use SQLite database for project.
* Install `sqlite3` gem.
* Clone the repo and include lib in rails db folder.
* Update `CATS_DB_FILE` and `CATS_SQL_FILE` in db_connection.rb to correct file paths.
* Create new model, inherit from SQLObject class, and invoke finalize!

```ruby
require 'sql_object'

class Villian < SQLObject
  has_many :enemies, foreign_key: :enemy_id
  self.finalize!
  ...
end
```

* Use methods to make necessary queries or associations.

##Core Methods
* `all` - returns an array of all records in database
* `find(id)` - returns a single record corresponding to primary key
* `where(params)` - takes a params hash as argument and returns an array of records that match specified params

```ruby
Cat.where(name: 'Catman') => [#<Cat:0x007f8379ced188 @attributes={:id=>1, :name=>"Catman", :owner_id=>1}>]
```

* `insert` - insert new row in into table that represents object and assigns id
* `update` - updates corresponding row of table
* `save` - invokes insert or update if record exists
* `destroy` - deletes object's row from table corresponding to primary key

##Associations
* `belongs_to(name, options)` - sets up connection that will return a single associated object

```ruby
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

```ruby
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
```ruby
[1] pry(main)> load 'demo.rb'
=> true
```
* Try `a = Cat.find(1)`
* Test associations

```ruby
[2] pry(main)> a = Cat.find(1)
=> #<Cat:0x007f97fc942988 @attributes={:id=>1, :name=>"Catman", :owner_id=>1}>
[3] pry(main)> a.superhero
=> #<Superhero:0x007f97fcfacfd0
 @attributes={:id=>1, :fname=>"Bruce", :lname=>"Wayne", :house_id=>1}>
[4] pry(main)> a.house
=> #<House:0x007f97fce791b8 @attributes={:id=>1, :address=>"Wayne Manor, Gotman City"}>
```
* Create a new Cat

```ruby
[5] pry(main)> b = Cat.new(name: "Fastcat", owner_id: 2)
=> #<Cat:0x007f97fcd4f148 @attributes={:name=>"Fastcat", :owner_id=>2}>
[6] pry(main)> b.save
=> 6
[7] pry(main)> c = Superhero.find(2)
=> #<Superhero:0x007fe0dce3e170
 @attributes={:id=>2, :fname=>"Barry", :lname=>"Allen", :house_id=>2}>
[8] pry(main)> c.cats
=> [#<Cat:0x007fe0dcc81148 @attributes={:id=>6, :name=>"Fastcat", :owner_id=>2}>]
```
