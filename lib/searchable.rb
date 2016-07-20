require_relative 'db_connection'
require_relative 'sql_object'

module Searchable
  def where(params)
    if params.is_a?(Hash)
      result = DBConnection.execute(<<-SQL, *params.values)
        SELECT
          *
        FROM
          #{table_name}
        WHERE
          #{params.keys.map { |key| "#{key} = ?"}.join(' AND ')}
      SQL
      parse_all(result)
    end
  end
end

class SQLObject
  extend Searchable
end
