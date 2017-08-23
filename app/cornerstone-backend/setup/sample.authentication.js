'use strict';

module.exports = function enableAuthentication(server) {
  // Insert the Admin user
  server.dataSources.cornerstone.automigrate('Author', function (err) {
    if (err) throw err;

    server.models.Author.create([{
        "realm": "",
        "username": "CORNERSTONE_ADMIN_USER",
        "email": "CORNERSTONE_EMAIL",
        "password": "CORNERSTONE_ADMIN_PASSWORD"
    }], function (er, users) {
        if (er) throw er;

        console.log("Created Author model: \n", users);
    });
  });

  // enable authentication
  server.enableAuth();
};
