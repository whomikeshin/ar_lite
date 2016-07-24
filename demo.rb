require_relative 'lib/associatable'


class Cat < SQLObject
  self.table_name = "cats"

  belongs_to :superhero, foreign_key: :owner_id
  has_one_through :house, :superhero, :house

  self.finalize!
end

class Superhero < SQLObject
  self.table_name = "superheroes"

  has_many :cats, foreign_key: :owner_id
  belongs_to :house

  self.finalize!
end

class House < SQLObject
  has_many :superheroes,
    class_name: "Superheroes",
    foreign_key: :house_id,
    primary_key: :id

  self.finalize!
end
