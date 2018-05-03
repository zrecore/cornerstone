import { TestBed, async } from '@angular/core/testing';

import { IndexComponent } from './index.component';

describe('IndexComponent', () => {
  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [
        IndexComponent
      ],
    }).compileComponents();
  }));

  it('should create the index', async(() => {
    const fixture = TestBed.createComponent(IndexComponent);
    const app = fixture.debugElement.componentInstance;
    expect(app).toBeTruthy();
  }));

});
