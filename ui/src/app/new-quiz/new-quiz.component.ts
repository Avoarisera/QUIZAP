import { Component } from '@angular/core';
import { FormBuilder, FormArray, FormGroup } from '@angular/forms';
import { ApiProxyService } from '../api-proxy.service';
import { Validators } from '@angular/forms';
@Component({
  selector: 'app-new-quiz',
  templateUrl: './new-quiz.component.html',
  styleUrls: ['./new-quiz.component.scss']
})

export class NewQuizComponent {
  quizForm = this.fb.group({
    name: ['', Validators.required],
    description: [''],
    questions: this.fb.array([
      this.fb.group({
        content: [''],
        coefficient: [''],
        answers: this.fb.array([
          this.fb.group({
            title: [''],
            correct_answer: [false]
          })])
      })
    ])
  });

  submitQuiz() {
    console.log('this.quizForm', this.quizForm)
    // this.apiProxyService.createQuizzes(this.quizForm).subscribe(data => {
		// 	console.log('data', data)
    //   // Do something
		// }).add(() => {
    //   // Do something
 		// });
  }

  // this.loginService.login

  questions(): FormArray {
    return this.quizForm.get('questions') as FormArray;
  }

  newQuestions(): FormGroup {
    return this.fb.group({
      content: [''],
      coefficient: [''],
      answers: this.fb.array([])
    });
  }

  addQuestions() {
    this.questions().push(this.fb.group({
      content: ['', {updateOn: 'blur'}],
      coefficient: '',
    }));
  }

  removeQuestion(quesIndex: number) {
    this.questions().removeAt(quesIndex);
  }

  newAnswer(): FormGroup {
    return this.fb.group({
      title: [''],
      correct_answer: [false]
    });
  }

  questionAnswers(quesIndex: number): FormArray {
    return this.questions()
      .at(quesIndex)
      .get('answers') as FormArray;
  }

  addAnswers(quesIndex: number) {
    this.questionAnswers(quesIndex).push(this.newAnswer())
  }

  removeAnswer(quesIndex: number, ansIndex: number) {
    this.questionAnswers(quesIndex).removeAt(ansIndex);
  }
  constructor(private fb: FormBuilder, private apiProxyService: ApiProxyService) { }
}
