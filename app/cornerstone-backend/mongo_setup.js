print("Creating mongodb user " + MONGODB_USER)
db.createUser({user: MONGODB_USER, pwd: MONGODB_PASSWORD, roles:[{role:"root", db:"admin"}]})
print("OK")