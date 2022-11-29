import { Component, OnInit } from '@angular/core';
import { LoginService } from '../login.service';
import { TokenStorageService } from '../token-storage.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  form: any = {
    email: null,
    password: null
  };
  isLoggedIn = false;
  isLoginFailed = false;
  errorMessage = '';
  roles: string[] = [];

  constructor(private loginService: LoginService, private tokenStorage: TokenStorageService, private router: Router) { }

  ngOnInit(): void {
    console.log('this.tokenStorage.getToken() login', this.tokenStorage.getToken())
    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = true;
    }
  }

  signIn(): void {
    const { email, password } = this.form;

    this.loginService.login(email, password).subscribe(
      data => {
        console.log('data', data)
        this.tokenStorage.saveToken(data.auth);

        this.isLoginFailed = false;
        this.isLoggedIn = true;
        this.router.navigate(['/quizzes']);
      },
      err => {
        this.errorMessage = err.error.message;
        this.isLoginFailed = true;
      }
    );
  }

  reloadPage(): void {
    window.location.reload();
  }
}