# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

cat1 = Cat.create(birth_date: '1/1/1990',color:  'white',name:  'ob',sex: 'M',description: 'col')
cat2 = Cat.create(birth_date: '1/1/1990',color:  'black',name:  'jerry',sex: 'M',description: 'col')
cat3 = Cat.create(birth_date: '1/1/1990',color:  'black',name:  'lil',sex: 'F',description: 'col')