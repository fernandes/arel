# frozen_string_literal: true
module FakeRecord
  class Column
    property :name, :type
    @name : String
    @type : Symbol

    def initialize(@name, @type)
    end
  end

  class Connection
    getter :tables
    property :visitor

    alias FakeRecordsColumns = Array(Array(FakeRecord::Column | String))
    @visitor : Arel::Visitors::ToSql?
    @columns : Hash(String, Array(FakeRecord::Column))
    @columns_hash : Hash(String, Array(Array(FakeRecord::Column | String)))
    #@columns_hash : NamedTuple(users: FakeRecordsColumns, products: FakeRecordsColumns)
    @primary_keys : Hash(String, String)

    def initialize(visitor = nil)
      @tables = %w{ users photos developers products}
      @columns = Hash(String, Array(FakeRecord::Column)).new
      @columns["users"] = [
        Column.new("id", :integer),
        Column.new("name", :string),
        Column.new("bool", :boolean),
        Column.new("created_at", :date)
      ]
      @columns["products"] = [
        Column.new("id", :integer),
        Column.new("price", :decimal)
      ]
      @columns_hash = Hash(String, FakeRecordsColumns).new
      @columns_hash["users"] = initialize_columns_hash(@columns["users"])
      @columns_hash["products"] = initialize_columns_hash(@columns["products"])
      @primary_keys = Hash(String, String).new
      @primary_keys["users"] = "id"
      @primary_keys["products"] = "products"
      @visitor = visitor
    end

    def initialize_columns_hash(columns)
      columns.map { |x| [x.name, x] }
    end

    def columns_hash(table_name)
      @columns_hash[table_name]
    end

    def primary_key(name)
      @primary_keys[name.to_s]
    end

    def data_source_exists?(name)
      @tables.include? name.to_s
    end

    def columns(name, message = nil)
      @columns[name.to_s]
    end

    def quote_table_name(name)
      "\"#{name.to_s}\""
    end

    def quote_column_name(name)
      "\"#{name.to_s}\""
    end

    def schema_cache
      self
    end

    def quote(thing)
      case thing
      when Time
        "'#{thing.strftime("%Y-%m-%d %H:%M:%S")}'"
      when Date
        "'#{thing.strftime("%Y-%m-%d")}'"
      when true
        "'t'"
      when false
        "'f'"
      when nil
        "NULL"
      when Int32
        thing
      else
        "'#{thing.to_s.gsub("'", "\\\\'")}'"
      end
    end
  end

  class ConnectionPool
    class Spec
      property :config
      @config : Hash(Symbol, String)
      def initialize(@config)
      end
    end

    getter :spec, :connection

    def initialize
      config_hash = {} of Symbol => String
      config_hash[:adapter] = "america"
      @spec = ConnectionPool::Spec.new(config_hash)
      @connection = Connection.new
      @connection.visitor = Arel::Visitors::ToSql.new(connection)
    end

    def with_connection
      yield connection
    end

    def table_exists?(name)
      connection.tables.include? name.to_s
    end

    def columns_hash
      connection.columns_hash
    end

    def schema_cache
      connection
    end

    def quote(thing)
      connection.quote thing
    end
  end

  class Base
    property :connection_pool

    def initialize
      @connection_pool = ConnectionPool.new
    end

    def connection
      connection_pool.connection
    end
  end

  # # Created specially for spec/arel/nodes/equality_spec.cr
  # class BaseEqualitySpec < Base
  #   def initialize
  #     @connection_pool = EqualityConnectionPool.new
  #   end
  # end
  #
  # class EqualityConnectionPool < ConnectionPool
  #   def initialize
  #     config_hash = {} of Symbol => String
  #     config_hash[:adapter] = "america"
  #     @spec = ConnectionPool::Spec.new(config_hash)
  #     @connection = EqualityConnection.new
  #     @connection.visitor = Arel::Visitors::ToSql.new(connection)
  #   end
  # end
  #
  # class EqualityConnection < Connection
  #   property :quote_count
  #
  #   @quote_count : Int32
  #
  #   def initialize(@visitor = nil)
  #     super
  #     @quote_count = 0
  #   end
  #
  #   def quote(*args)
  #     @quote_count += 1
  #     super
  #   end
  #
  #   def quote_column_name(*args)
  #     @quote_count += 1
  #     super
  #   end
  #
  #   def quote_table_name(*args)
  #     @quote_count += 1
  #     super
  #   end
  # end
end
