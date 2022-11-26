import { Component } from '@angular/core';
import { FormBuilder, FormArray } from '@angular/forms';
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
        answers: 
          this.fb.group({
            content: [''],
            correct_answer: [false]
          })
      })
    ])
  });
  onSubmit() {
    // TODO: Use EventEmitter with form value
    console.warn(this.quizForm.value);
  }

  get questions() {
    // console.log('this.questions.controls', this.questions.controls)
    return this.quizForm.get('questions') as FormArray;
  }

  // get answers(index: any) {
  //   return this.questions.controls[index]?.answers as FormArray;
  // }

  addQuestions() {
    console.log('this.questions', this.questions)
    // console.log('this.answers', this.answers)
    this.questions.push(this.fb.group({
      content: ['', {updateOn: 'blur'}],
      coefficient: '',
    }));
  }

  addAnswers() {
    console.log('this.questions', this.questions)
    this.questions.push(this.fb.group({
      content: ['', {updateOn: 'blur'}],
      coefficient: '',
    }));
  }

  constructor(private fb: FormBuilder) { }
}
