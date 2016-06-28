require_relative 'lib/associatable'

class Cat < SQLObject
  self.table_name = "cats"

  belongs_to :human, foreign_key: :owner_id
  has_one_through :house, :human, :house

  self.finalize!
end

class Human < SQLObject
  self.table_name = "humans"

  has_many :cats, foreign_key: :owner_id
  belongs_to :house

  self.finalize!
end

class House < SQLObject
  has_many :humans,
    class_name: "Humans",
    foreign_key: :house_id,
    primary_key: :id

  self.finalize!
end
