
require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://localhost/database_play')

class Student
  include DataMapper::Resource
  property :id, Serial
  property :name, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

Student.create(name: "Lo")

student = Student.first(name: 'Lo')
student.destroy
