let cornerstone = require('../../server/backend.config.json');
let path = require('path');

module.exports = function(Author) {
    Author.afterRemote('create', function (ctx, author, next) {
        var options = {
            "type": "email",
            "from": cornerstone.website_email,
            "to": author.email,
            "subject": cornerstone.website_name + "Thank you for registering!",
            "template": path.resolve(__dirname, '../../server/views/verify.ejs'),
            "verifyHref": cornerstone.website_url + '/verify',
            "user": author
        };//,
        // mail = Author.app.datasources['gmail'];

        author.verify(options, function (err) {
            if (err) {
                console.log("ERROR at author.js::verify() ", err);
                next(err);
            } else {
                console.log("author.js::afterRemote() Verification e-mail sent.");
                next();
            }


        });
    });
};
