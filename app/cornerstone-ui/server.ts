import 'reflect-metadata';
import 'zone.js/dist/zone-node';
import { renderModuleFactory } from '@angular/platform-server'
import { enableProdMode } from '@angular/core'
import * as express from 'express';
import * as cookieParser from 'cookie-parser';

import { readFileSync } from 'fs';
import { join } from 'path';
import { environment } from './src/environments/environment';

import { provideModuleMap } from '@nguniversal/module-map-ngfactory-loader';

import { HttpModule } from '@angular/http';

import * as bodyParser from 'body-parser';
import * as multer from 'multer';
import * as nodemailer from 'nodemailer';

import { check } from 'express-validator/check';
import { sanitizeBody } from 'express-validator/filter';

let upload = multer();

// import { RequestService } from './src/app/service/request.service';
// import { ResponseService } from './src/app/service/response.service';

enableProdMode();

const app = express();
const PORT = parseInt(process.env.PORT) || 4200;
const DIST_FOLDER = join(process.cwd(), 'dist');

// const https = require('https');
const helmet = require('helmet');
// const ssl_key = readFileSync("/vagrant/app/your_ssl.key");
// const ssl_cert = readFileSync("/vagrant/app/your_ssl.crt");
// const sslOptions = {
//     key: ssl_key,
//     cert: ssl_cert,
// };

const template = readFileSync(join(DIST_FOLDER, 'browser', 'index.html')).toString();

const { AppServerModuleNgFactory, LAZY_MODULE_MAP } = require('./dist/server/main');

import { ngExpressEngine } from '@nguniversal/express-engine';
import { Request, Response } from 'express';
import { REQUEST, RESPONSE } from '@nguniversal/express-engine/tokens'

app.use(cookieParser());
app.use(helmet());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.engine('html', (_, options, callback) => {
    const opts = { 
        document: template, 
        url: options.req.url,
        extraProviders: [
            { provide: "REQUEST", useValue: REQUEST },
            { provide: "RESPONSE", useValue: RESPONSE },
            provideModuleMap(LAZY_MODULE_MAP)
        ]
    };

    renderModuleFactory(AppServerModuleNgFactory, opts)
        .then(html => callback(null, html));
});

app.set('view engine', 'html');
app.set('views', join(DIST_FOLDER, 'browser') );

app.get('*.*', express.static(join(DIST_FOLDER, 'browser')));

// Handle POST request for contact form.
app.post('/contact-api', [
    
    check('email').isEmail(),
    check('name').isLength({min: 2}),
    sanitizeBody('name').trim().escape(),
    sanitizeBody('message').trim().escape()

    ], (req: Request, res: Response) => {

    let data : any = (req.body);

    console.log('E-Mail:', data.email);
    console.log('Name:', data.name);
    console.log('Message:', data.message);

    let transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 587,
        secure: false,
        auth: {
            user: environment.email_user,
            pass: environment.email_password
        }
    });

    let mailOptions = {
        from: '"' + environment.email_from_name + '" <' + environment.email_from_address + '>',
        to: environment.email_address_to,
        replyTo: data.email,
        subject: "Contact Request",
        text: data.message
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            res.send(error);
            return console.log(error);
        }

        console.log('Message sent!', info);
        res.send(info);
    });
});

// Handle everything else.
app.all('*', (req: Request, res: Response) => {
    res.render(
        join(DIST_FOLDER, 'browser', 'index.html'), 
        {
            req: req, 
            res: res, 
            providers: [ 
                {provide: 'REQUEST', useValue: (req)}, 
                {provide: 'RESPONSE', useValue: (res)}
            ]
        }
    );
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`listening on :${PORT}!`);
});

// https.createServer(sslOptions, app).listen(8443);