set -e

mongo <<EOF

db = db.getSiblingDB('fake-corp')

db.createCollection('organisations')
db.organisations.insertMany([
    {"name":"alpha-org", "location": "Nevada", "roles":[{"general_user":{"products":[]}},{"apprentice":{"products":["pen"]}}]},
    {"name":"beta-org", "location": "Athens", "roles":[{"general_user":{"products":[]}},{"apprentice":{"products":["paper"]}}]}
])

db.createCollection('customers')
db.customers.insertMany([
    {"name":"Alan", "age":22, "location":"Antwerp" ,"organisation":"alpha-org", "role":"general"},
    {"name":"Aziz", "age":33, "location":"Ashbury de la Zouch" ,"organisation":"alpha-org", "role":"apprentice"},
    {"name":"Brenda", "age":44, "location":"Bodmin" ,"organisation":"beta-org", "role":"general"},
    {"name":"Bilbo", "age":22, "location":"Bangor" ,"organisation":"beta-org", "role":"apprentice"}
])

db.createCollection('orders')

db.createCollection('manufacturers')
db.manufacturers.insertMany([
    {"name":"ACME", "location":"Hollywood"},
    {"name":"Dodgy Nigels Discount Stationary", "location":"Plymouth"},
    {"name":"World of Pickles", "location":"Chipping Sodbury"},
    {"name":"Ranjit's TV references", "location":"New York"}
])

db.createCollection('products')
db.products.insertMany([
    {"name":"paper", "manufacturer":"Dodgy Nigels Discount Stationary", "cost":12.34 },
    {"name":"pen", "manufacturer":"Dodgy Nigels Discount Stationary", "cost":12.34 },
    {"name":"lemons", "manufacturer":"World of Pickles", "cost":5.87 },
    {"name":"TNT", "manufacturer":"ACME", "cost":12.34 },
    {"name":"Blue French Horn", "manufacturer":"Ranjit's TV references", "cost":51.31 },
    {"name":"purple monkey dishwasher", "manufacturer":"Ranjit's TV references", "cost":445.54 }
])

EOF