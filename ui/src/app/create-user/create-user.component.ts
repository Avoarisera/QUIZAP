import { Component } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { TokenStorageService } from '../token-storage.service';
import { ApiProxyService } from '../api-proxy.service';
import { Router } from '@angular/router';
import { Validators } from '@angular/forms';
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

	usersList: any


  onCreateUser() {
    console.log('this.profileForm.value', this.profileForm.value)
    this.apiProxyService.createUsers(this.profileForm.value).subscribe(data => {
			console.log('data', data)
			this.router.navigate(['/students']);
		}).add(() => {
			this.router.navigate(['/students']);
 		});
  }


	constructor(private http: HttpClient, private tokenStorageService: TokenStorageService, private router: Router, private fb: FormBuilder, private apiProxyService: ApiProxyService) { }
}
