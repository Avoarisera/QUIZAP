import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { QuizzesListComponent } from './quizzes-list/quizzes-list.component';
import { QuizDetailsComponent } from './quiz-details/quiz-details.component';
import { LoginComponent } from './login/login.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NewQuizComponent } from './new-quiz/new-quiz.component';
import { CreateUserComponent } from './create-user/create-user.component';
@NgModule({
  declarations: [
    AppComponent,
    QuizzesListComponent,
    QuizDetailsComponent,
    LoginComponent,
    NewQuizComponent,
    CreateUserComponent
  ],
  imports: [
    BrowserModule,
    NgbModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    RouterModule.forRoot([
      { path: '', component: QuizzesListComponent },
      { path: 'login', component: LoginComponent },
      { path: 'new-student', component: CreateUserComponent },
      { path: 'new-quiz', component: NewQuizComponent },
      { path: 'quizzes/:quiz_id', component: QuizDetailsComponent },
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
