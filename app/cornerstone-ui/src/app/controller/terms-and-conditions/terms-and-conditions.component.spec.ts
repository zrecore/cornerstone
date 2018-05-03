import { TestBed, async } from '@angular/core/testing';

import { TermsAndConditionsComponent } from './terms-and-conditions.component';

describe('TermsAndConditionsComponent', () => {
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [
        TermsAndConditionsComponent
      ],
    }).compileComponents();
  }));

  it('should create the terms and conditions component', async(() => {
    const fixture = TestBed.createComponent(TermsAndConditionsComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app).toBeTruthy();
  }));
});
