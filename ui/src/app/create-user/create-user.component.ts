import { Component } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.scss']
})
export class CreateUserComponent {
  profileForm = new FormGroup({
    firstName: new FormControl(''),
    email: new FormControl(''),
    username: new FormControl(''),
    lastName: new FormControl(''),
  });

  onCreateUser() {
    // TODO: Use EventEmitter with form value
    console.warn(this.profileForm.value);
  }
}
