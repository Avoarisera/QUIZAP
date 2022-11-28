import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { TokenStorageService } from '../token-storage.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

const AUTH_API = 'http://localhost:3000';

@Component({
  selector: 'app-students-list',
  templateUrl: './students-list.component.html',
  styleUrls: ['./students-list.component.scss']
})

export class StudentsListComponent {

  headers =  new HttpHeaders({ 
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
    "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
		'Authorization': `Bearer ${this.tokenStorageService.getToken()}`
  })
	usersList: any
	httpOptions = {
		headers: this.headers
	}

	ngOnInit() {
    if (!this.tokenStorageService.getToken()) {
      this.router.navigate(['/login']);
    }
		console.log('this.tokenStorageService.getToken()', this.tokenStorageService.getToken())
		this.getAllUsers()
	}

	getAllUsers() {
		this.http
		.get(`${AUTH_API}/users`, {
			headers: this.headers
		})
		.subscribe(data => {
			console.log('data users', data)
			this.usersList = data
		});
  }

	createUsers(userInfo: any): Observable<any> {
    return this.http.post(`${AUTH_API}/users`, {
			data: {
				type: "users",
				attributes: userInfo
			}
    },this.httpOptions);
  }

	deleteUser(userId: any): Observable<any> {
    return this.http.delete(`${AUTH_API}/users/${userId}`,this.httpOptions);
  }

	constructor(private http: HttpClient, private tokenStorageService: TokenStorageService, private router: Router) { }

}
