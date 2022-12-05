import { Component } from '@angular/core';
import { LoginService } from '../login.service';
import { TokenStorageService } from '../token-storage.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  form: any = {
    email: null,
    password: null
  };
  isLoggedIn = !!this.tokenStorage.getToken();
  isLoginFailed = false;
  errorMessage = '';
  loginLoading = false
  roles: string[] = [];

  constructor(private loginService: LoginService, private tokenStorage: TokenStorageService, private router: Router) { }

  signIn(): void {
    this.loginLoading = true
    const { email, password } = this.form;

    this.loginService.login(email, password).subscribe(
      data => {
        console.log('data', data)
        this.tokenStorage.saveToken(data.auth);

        this.isLoginFailed = false;
        this.router.navigate(['/quizzes']);
      },
      err => {
        this.errorMessage = err.error.message;
        this.isLoginFailed = true;
      }
    ).add(() => {
      this.loginLoading = false
 		});
  }

  reloadPage(): void {
    window.location.reload();
  }
}