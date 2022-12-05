import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { TokenStorageService } from '../token-storage.service';
import { ApiProxyService } from '../api-proxy.service';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

const AUTH_API = 'https://quizap-test.herokuapp.com';

@Component({
  selector: 'app-quizzes-list',
  templateUrl: './quizzes-list.component.html',
  styleUrls: ['./quizzes-list.component.scss']
})
export class QuizzesListComponent {
	valueFromServer: any = null; // This should be set to an actual type, not any, ideally.
	loadQuizzes = true
	headers =  new HttpHeaders({ 
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
    "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
		'Authorization': `Bearer ${this.tokenStorageService.getToken()}`
  })
	quizzesList: any
	httpOptions = {
		headers: this.headers
	}

	ngOnInit() {
    if (!this.tokenStorageService.getToken()) {
      this.router.navigate(['/login']);
    }

		this.apiProxyService.getAllquizzes().subscribe(data => {
			console.log('data', data)
			this.quizzesList = data
		}).add(() => {
			this.loadQuizzes = false
 		});
	}

	deleteQuiz(Id: any) {
    this.apiProxyService.deleteQuizzes(Id).subscribe(() => {
			alert(`Quiz ${Id} was deleted`)
		}).add(() => {
			// Do something
 		});
  }

	constructor(private http: HttpClient, private tokenStorageService: TokenStorageService, private router: Router, private apiProxyService: ApiProxyService) { }

}

 