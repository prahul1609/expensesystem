# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###################Role Table############################
roles=[
{name:'admin'},
{name:'user'}]
roles.each{|e| Role.create e}

###############Users Table###############################
User.create(first_name: 'demo', last_name: 'dual', role: Role.find_by_name('admin').name, mail_id: 'pr@mail.com', password: 'rahul123', password_confirmation: 'rahul123')
User.create(first_name: 'demo1', last_name: 'dual1', role: Role.find_by_name('user').name, mail_id: 'qr@mail.com', password: 'rahul123', password_confirmation: 'rahul123')
Inventory.create(user_id: User.find_by_mail_id('pr@mail.com'),description: 'Spianch and other stuffs',item_type: 'Grossary',purchase_date: DateTime.strptime("06/01/2015", "%m/%d/%Y"),amount_cents: 120)
Inventory.create(user_id: User.find_by_mail_id('qr@mail.com'),description: 'ytew wiuew wd dwdw',item_type: 'Vegetables',purchase_date: DateTime.strptime("06/02/2015", "%m/%d/%Y"),amount_cents: 430)
Inventory.create(user_id: User.find_by_mail_id('pr@mail.com'),description: 'Leindekj d eidd ek',item_type: 'Electrics',purchase_date: DateTime.strptime("06/03/2015", "%m/%d/%Y"),amount_cents: 240)
