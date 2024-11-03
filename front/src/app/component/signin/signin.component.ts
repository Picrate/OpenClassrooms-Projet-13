import { Component } from '@angular/core';
import {Router} from '@angular/router';
import {FormControl, FormGroup} from '@angular/forms';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrl: './signin.component.css'
})
export class SigninComponent {
  constructor(private routeur: Router) {
  }

  signinForm: FormGroup = new FormGroup({
    username: new FormControl(''),
    password: new FormControl('')
  });

  onSubmit() {
    sessionStorage.setItem('username', this.signinForm.controls['username'].value);
    this.routeur.navigate(['/chat-board']);
  }
}
