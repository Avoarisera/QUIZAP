import { Component } from '@angular/core';
import { FormBuilder, FormArray, FormGroup } from '@angular/forms';
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
  onSubmit() {
    // TODO: Use EventEmitter with form value
    console.warn(this.quizForm.value);
  }

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

  removeEmployee(quesIndex: number) {
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
  constructor(private fb: FormBuilder) { }
}
