let cornerstone = require('../../server/backend.config.json');

module.exports = function(Author) {
    Author.afterRemote('create', function (ctx, author, next) {
        var options = {
            "type": "email",
            "from": cornerstone.website_name
        },
        mail = Author.app.datasources['GMail'];

        author.verify(options, function (err) {
            if (err) {
                console.log("ERROR at author.js::verify() ", err);
                next(err);
            } else {
                next();
            }


        });
    });
};
