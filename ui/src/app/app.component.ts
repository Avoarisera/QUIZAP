import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { TokenStorageService } from './token-storage.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  isLoggedIn = false;
  title = 'Oivan test assesment';
  public isCollapsed = true;

  constructor(private modalService: NgbModal,private tokenStorageService: TokenStorageService, private router: Router) {
  }

  ngOnInit(): void {
    this.isLoggedIn = !!this.tokenStorageService.getToken();
    console.log('this.tokenStorageService.getToken()', !!this.tokenStorageService.getToken())
    if (!this.isLoggedIn) {
      this.router.navigate(['/login']);
    }
  }

  public open(modal: any): void {
    this.modalService.open(modal);
  }

  logout(): void {
    this.tokenStorageService.signOut();
    window.location.reload();
  }
}
