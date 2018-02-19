import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RamalComponent } from './ramal.component';

describe('RamalComponent', () => {
  let component: RamalComponent;
  let fixture: ComponentFixture<RamalComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RamalComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RamalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
