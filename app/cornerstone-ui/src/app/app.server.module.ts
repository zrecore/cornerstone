import { NgModule } from '@angular/core';
import { ServerModule } from '@angular/platform-server';
import { ServerCookiesModule } from '@ngx-utils/cookies/server';
import { AppModule } from './app.module';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
// import { RequestService } from './service/request.service';
// import { ResponseService } from './service/response.service';
// import { Request, Response } from 'express';
// import { REQUEST, RESPONSE } from '@nguniversal/express-engine/src/tokens';

// import { CookieService, CookieBackendService } from 'ngx-cookie';


@NgModule({
    imports: [
        AppModule,
        ServerModule,
        ServerCookiesModule.forRoot(),
        HttpModule
    ],
    bootstrap: [AppComponent],
    // providers: [
        // { provide: CookieService, useClass: CookieBackendService } //, 
        // { provide: REQUEST, useValue: REQUEST },
        // { provide: RESPONSE, useValue: RESPONSE },
    // ]
})
export class AppServerModule { }