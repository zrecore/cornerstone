import 'reflect-metadata';
import 'zone.js/dist/zone-node';
import { renderModuleFactory } from '@angular/platform-server'
import { enableProdMode } from '@angular/core'
import * as express from 'express';
import * as cookieParser from 'cookie-parser';

import { readFileSync } from 'fs';
import { join } from 'path';
import { environment } from './src/environments/environment';

import { HttpModule } from '@angular/http';


// import { RequestService } from './src/app/service/request.service';
// import { ResponseService } from './src/app/service/response.service';

enableProdMode();

const app = express();
const PORT = process.env.PORT || 4200;
const DIST_FOLDER = join(process.cwd(), 'dist');
//  --host 0.0.0.0 --disable-host-check --ssl 1 --ssl-key \"/vagrant/app/setup/ssl/star.scener.com.key\" --ssl-cert \"/vagrant/app/setup/ssl/star.scener.com_GoDaddy/f4b7d873e8d9e500.crt\"
const https = require('https');
const helmet = require('helmet');
const ssl_key = readFileSync("/vagrant/app/setup/ssl/star.scener.com.key");
const ssl_cert = readFileSync("/vagrant/app/setup/ssl/star.scener.com_GoDaddy/f4b7d873e8d9e500.crt");
const sslOptions = {
    key: ssl_key,
    cert: ssl_cert,
};

const template = readFileSync(join(DIST_FOLDER, 'browser', 'index.html')).toString();

const { AppServerModuleNgFactory, LAZY_MODULE_MAP } = require('./dist/server/main.bundle');

const { provideModuleMap } = require('@nguniversal/module-map-ngfactory-loader');

import { ngExpressEngine } from '@nguniversal/express-engine';
import { Request, Response } from 'express';
import { REQUEST, RESPONSE } from '@nguniversal/express-engine/src/tokens'

app.use(cookieParser());
app.use(helmet());

app.engine('html', (_, options, callback) => {
    const opts = { 
        document: template, 
        url: options.req.url,
        extraProviders: [
            { provide: "REQUEST", useValue: REQUEST },
            { provide: "RESPONSE", useValue: RESPONSE },
            // { provide: "Request", useValue: Request },
            // { provide: "Response", useValue: Response },
            // { provide: "cookie", useValue: {} },
            provideModuleMap(LAZY_MODULE_MAP)
        ]
    };

    renderModuleFactory(AppServerModuleNgFactory, opts)
        .then(html => callback(null, html));
});

app.set('view engine', 'html');
app.set('views', join(DIST_FOLDER, 'browser') );

app.get('*.*', express.static(join(DIST_FOLDER, 'browser')));

// app.get('*', (req: Request, res: Response) => {
//     res.render('../dist/index', {req, res});
// });

app.all('*', (req: Request, res: Response) => {
    res.render(
        join(DIST_FOLDER, 'browser', 'index.html'), 
        {
            req: req, 
            res: res, 
            providers: [ 
                {provide: 'REQUEST', useValue: (req)}, 
                {provide: 'RESPONSE', useValue: (res)} //,
                // {provide: 'Request', useValue: (Request)},
                // {provide: 'Response', useValue: (Response)}
            ]
        }
    );
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`listening on :${PORT}!`);
});

https.createServer(sslOptions, app).listen(8443);