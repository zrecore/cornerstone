import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { environment } from './environments/environment';
import { AppModule } from './app/app.module';

if (environment.production) {
  enableProdMode();
}

const bootstrapPromise = platformBrowserDynamic().bootstrapModule(AppModule);

bootstrapPromise.then(success => console.log("Angular bootstrap OK.")).catch(err => console.error(err));
