import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { TokenStorageService } from './token-storage.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

const AUTH_API = 'https://quizap-test.herokuapp.com';

@Injectable({
  providedIn: 'root'
})
export class ApiProxyService {
  headers =  new HttpHeaders({ 
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
    "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
		'Authorization': `Bearer ${this.tokenStorageService.getToken()}`
  })
	httpOptions = {
		headers: this.headers
	}

  createUsers(userInfo: any): Observable<any> {
    return this.http.post(`${AUTH_API}/users`, {
			data: {
				type: "users",
				attributes: userInfo
			}
    },this.httpOptions);
  }

  getAllquizzes() {
		return this.http
		.get(`${AUTH_API}/quizzes`, {
			headers: this.headers
		})
  }

  createQuizzes(quizInfo: any): Observable<any> {
    return this.http.post(`${AUTH_API}/quizzes`, {
			data: {
				type: "quizzes",
				attributes: quizInfo
			}
    },this.httpOptions);
  }

	deleteQuizzes(quizId: any): Observable<any> {
    return this.http.delete(`${AUTH_API}/quizzes/${quizId}`,this.httpOptions);
  }

  getAllUsers() {
		return this.http
      .get(`${AUTH_API}/users`, {
        headers: this.headers
      })
  }

	deleteUser(userId: any) {
    return this.http.delete(`${AUTH_API}/users/${userId}`,this.httpOptions).subscribe(data => {
			console.log(data)
			alert("User was deleted")
			window.location.reload();
		})
  }

  constructor(private http: HttpClient, private tokenStorageService: TokenStorageService, private router: Router) { }
}
