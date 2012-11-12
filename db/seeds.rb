# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'a', email: 'a@a.com', password: 'aaaaaa')

AnimalType.create([{ species: 'Lion' }, { species: 'Panda' },{species: 'Koala'}])
Animal.create([
  #lions
  {breeding_status: 'viable', comments: 'good', dob: '2009-09-01', gender: 'female', name: 'Nala', animal_type_id: 1, zoo_id: 1},
  {breeding_status: 'viable', comments: 'playful', dob: '2009-09-03', gender: 'male', name: 'Simba', animal_type_id: 1, zoo_id: 1},
  {breeding_status: 'unviable', comments: 'unhealthy', dob: '2004-09-03', gender: 'male', name: 'Mufasa', animal_type_id: 1, zoo_id: 1},
  {breeding_status: 'pregnant', comments: 'due december 2012', dob: '2009-12-03', gender: 'female', name: 'Leona', animal_type_id: 1, zoo_id: 1},
  #pandas
  {breeding_status: 'viable', comments: '', dob: '2006-01-21', gender: 'female', name: 'Hua Mei', animal_type_id: 2, zoo_id: 1},
  {breeding_status: 'viable', comments: '', dob: '2007-02-11', gender: 'male', name: 'Mei Sheng', animal_type_id: 2, zoo_id: 1},
  {breeding_status: 'viable', comments: '', dob: '2009-09-05', gender: 'male', name: 'Yun Zi', animal_type_id: 2, zoo_id: 1},
  #koalas
  {breeding_status: 'viable', comments: '', dob: '2006-01-21', gender: 'female', name: 'Alkira', animal_type_id: 3, zoo_id: 1},
  {breeding_status: 'sterilized', comments: '', dob: '2007-02-11', gender: 'female', name: 'Lowanna', animal_type_id: 3, zoo_id: 1},
  {breeding_status: 'viable', comments: '', dob: '2009-09-05', gender: 'male', name: 'Mandu', animal_type_id: 3, zoo_id: 1}
])
