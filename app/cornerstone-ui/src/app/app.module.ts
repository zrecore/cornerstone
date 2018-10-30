// Angular Core
import { ModuleWithProviders, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserCookiesModule } from '@ngx-utils/cookies/browser';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { environment } from '../environments/environment';

// Controllers
import { IndexComponent } from './controller/index/index.component';
import { TermsAndConditionsComponent } from './controller/terms-and-conditions/terms-and-conditions.component';
import { PrivacyPolicyComponent } from './controller/privacy-policy/privacy-policy.component';

// Ui
import { NavigationComponent } from './ui/navigation/navigation.component';
import { FooterComponent } from './ui/footer/footer.component';

// App
import { AppComponent } from './app.component';

const appRoutes: Routes = [
  { path: 'privacy', component: PrivacyPolicyComponent },
  { path: 'terms', component: TermsAndConditionsComponent },
  
  { path: '', component: IndexComponent }
  // { path: '**', component: PageNotFoundComponent }
];

const rootRouting: ModuleWithProviders = RouterModule.forRoot(appRoutes,
      { useHash: false, enableTracing: environment.production ? false : true }); // Set enableTracing to true for Debug only!


@NgModule({
  providers: [
    // Services
    
  ],
  declarations: [
    // App
    AppComponent,
    
    // Controllers
    IndexComponent,
    TermsAndConditionsComponent,
    PrivacyPolicyComponent,

    // UI
    NavigationComponent,
    FooterComponent
  ],
  imports: [
    // Angular Core
    BrowserModule.withServerTransition({ appId: 'cornerstone-ui'}),
    BrowserCookiesModule.forRoot(),
    rootRouting,
    FormsModule,
    HttpClientModule
    
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
