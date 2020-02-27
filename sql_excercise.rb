require 'sqlite3'
if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")

db.execute <<-SQL
    create table users(
      id integer primary key,
      email varchar,
      password varchar);
  SQL


db.execute("insert into users(email) values(?);",["sam@example.com"]);
db.execute("insert into users(email) values(?);",["jane@life.co"]);
db.execute("insert into users(email) values(?);",["rachel@me.com"]);
rows = db.execute("SELECT * FROM users;")
puts rows