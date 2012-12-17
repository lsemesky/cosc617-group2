# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Zoo.delete_all
Animal.delete_all


User.create([{name: 'Amanda', email: 'a@a.org', password: 'aaaaaa'},
  {name: 'Barry', email: 'b@b.org', password: 'bbbbbb'},
  {name: 'Carrol', email: 'c@c.org', password: 'cccccc'}])
Zoo.create([
  {address: '1876 Mansion House Drive, Baltimore, MD 21217', email: 'admin@marylandzoo.org', name: 'The Maryland Zoo in Baltimore', phone: '443-552-5296', ed: '1984-01-01', belongs: 'Region-owned', remarks: '', user_id: 1},
  {address: '2920 Zoo Drive, San Diego, CA 92101', email: 'admin@sandiegozoo.org', name: 'The San Diego Zoo', phone: '619-231-1515', ed: '1964-09-23', belongs: 'Region-owned', remarks: '', user_id: 2},
  {address: '3400 West Girard Avenue, Philadelphia, PA 19104', email: 'admin@philadelphiazoo.org', name: 'The Philadelphia Zoo', phone: '215-243-1100', ed: '1976-03-14', belongs: 'Region-owned', remarks: '', user_id: 3}
    ])
Animal.create([
  #lions
  {breeding_status: 'viable', comments: 'good', dob: '2009-09-01', gender: 'female', name: 'Nala', animal_type: 'Lion', zoo_id: 3},
  {breeding_status: 'viable', comments: 'playful', dob: '2009-09-03', gender: 'male', name: 'Simba', animal_type: 'Lion', zoo_id: 2},
  {breeding_status: 'unviable', comments: 'unhealthy', dob: '2004-09-03', gender: 'male', name: 'Mufasa', animal_type: 'Lion', zoo_id: 1, father_id: 2, mother_id: 1},
  {breeding_status: 'pregnant', comments: 'due december 2012', dob: '2009-12-03', gender: 'female', name: 'Leona', animal_type: 'Lion', zoo_id: 3, father_id: 2, mother_id: 1},
  #pandas
  {breeding_status: 'viable', comments: '', dob: '2006-01-21', gender: 'female', name: 'Hua Mei', animal_type: 'Panda', zoo_id: 3},
  {breeding_status: 'viable', comments: '', dob: '2007-02-11', gender: 'male', name: 'Mei Sheng', animal_type: 'Panda', zoo_id: 1},
  {breeding_status: 'viable', comments: '', dob: '2009-09-05', gender: 'male', name: 'Yun Zi', animal_type: 'Panda', zoo_id: 2},
  #koalas
  {breeding_status: 'viable', comments: '', dob: '2006-01-21', gender: 'female', name: 'Alkira', animal_type: 'Koala', zoo_id: 3},
  {breeding_status: 'sterilized', comments: '', dob: '2007-02-11', gender: 'female', name: 'Lowanna', animal_type: 'Koala', zoo_id: 3},
  {breeding_status: 'viable', comments: '', dob: '2009-09-05', gender: 'male', name: 'Mandu', animal_type: 'Koala', zoo_id: 2}
])
