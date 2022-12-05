import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const AUTH_API = 'https://quizap-test.herokuapp.com';

const httpOptions = {
  headers: new HttpHeaders({ 
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
    "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization"
  })
};
@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(private http: HttpClient) { }

  login(email: string, password: string): Observable<any> {
    return this.http.post(AUTH_API + '/sign-in', {
      email,
      password
    }, httpOptions);
  }
}
