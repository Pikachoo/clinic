# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PassportSeries.create([{name: 'AB'}, {name: 'BM'}, {name: 'HB'}, {name: 'KH'},
                       {name: 'MP'}, {name: 'MC'}, {name: 'KB'}, {name: 'PP'}])
Symptom.create([{name: 'Агрессивность'}, {name: 'Аменорея'} , {name: 'Амнезия'}, {name: 'Анальный зуд'},
                {name: 'Анемия'},{name: 'Боль в анальном отверстии'}, {name: 'Боль в бедре'},
                {name: 'Боль в боку'}, {name: 'Боль в веке'}, {name: 'Боль в верхней части спины'},
                {name: 'Боль в верхней части живота'}, {name: 'Боль в висках'}, {name: 'Боль в глазах'},
                {name: 'Боль в горле'}, {name: 'Боль в груди'}, {name:'Боль в груди при вдохе'}, {name: 'Боль в желудке'},
                {name: 'Боль в запястье'}])
