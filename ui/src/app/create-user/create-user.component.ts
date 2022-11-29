import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { TokenStorageService } from '../token-storage.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { Validators } from '@angular/forms';


const AUTH_API = 'https://quizap-test.herokuapp.com';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.scss']
})
export class CreateUserComponent {
  profileForm = this.fb.group({
    email: ['', Validators.required],
    first_name: ['', Validators.required],
    last_name: ['', Validators.required],
    password: ['', Validators.required],
  });

  loadUsers = false
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

  onCreateUser() {
    console.log('this.profileForm.value', this.profileForm.value)
    this.createUsers(this.profileForm.value).subscribe(data => {
			console.log('data', data)
			this.router.navigate(['/students']);
		}).add(() => {
			this.router.navigate(['/students']);
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
	constructor(private http: HttpClient, private tokenStorageService: TokenStorageService, private router: Router, private fb: FormBuilder) { }
}
