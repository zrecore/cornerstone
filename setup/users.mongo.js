print("Creating mongodb user " + DB_USER)
db.createUser({user: DB_USER, pwd: DB_PASSWORD, roles:[{role:"root", db:"admin"}]})
print("OK")