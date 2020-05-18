# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PurchaseOrder.create([
    {client_number: "2", delivery_address: "112 Castleforbes Square", delivery_city: "Dublin", delivery_country: "Ireland", delivery_fee: 5.65},
    {client_number: "5", delivery_address: "100 Merrion Square", delivery_city: "Dublin", delivery_country: "Ireland", delivery_fee: 2.99}
  ])


OrderItem.create([
    {purchase_order_id: 1, item_title:'Mask', item_description:'Protect yourself and others', item_quantity:4, item_price:'45'},
    {purchase_order_id: 1, item_title:'Mask2', item_description:'Better protect yourself and others', item_quantity:2, item_price:'99'},
    {purchase_order_id: 1, item_title:'Cream', item_description:'SPF', item_quantity:1, item_price:'29'},
    {purchase_order_id: 1, item_title:'Aspirin', item_description:'Againt headache', item_quantity:3, item_price:'4.99'}
  ])