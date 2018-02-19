import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

const url = 'http://10.62.1.170:3000/ramais';

@Injectable()
export class AppService {

  constructor( private http: HttpClient ) { }

  getRamais(){
    return this.http.get(url);
  }

}
