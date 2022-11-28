# QUIZAPP
**QUIZ CRUD with ruby on rails and angular**
I choose to create a ruby on rails api-only for the backend rather than a fullstack app with API inside to have more flexibility when develop the UI also with ruby on rails 7 the API only with rails was really improved to be more scalable
by the way It was the first time I used mono-repo that's why I had some hard time to achive the app correctly
here is the project board I used to manage the task I had to do and  monitor my progress https://github.com/users/Avoarisera/projects/1

Here is the report about what you can see in this repo:

## API 
**back-end using ruby on rails api --only**
### Done
      - Authentication with token user JsonWebtoken (tested)
      - quiz CRUD and validation with test
      - question CRUD and validation with test
      - user CRUD with test
      - users roles relation 
      - results CRUD (without validation and test)
### Not Done Yet
        - results test integration 
        - role test integration 
        - !!!! deploiment on heroku was done correctly but not working when UI is doing http call !!!!
## UI 
### Done
    - login page with token and session storage and logout too
    - being redirected if not logged in 
    - quizzes List call the API
    - Quiz creation page
    - User creation Page
    - users Lists call the API 
    - Bootstrap installation (all page created is well integrated with it )
### Not Done Yet
    - Update quiz and User page
    - deployment
    - router guard

the api should be deployed on heroku and the UI on netlify but unfortunately that wasn't done 


**here is the DB schema**
![Capture d’écran 2022-11-25 à 23 11 23](https://user-images.githubusercontent.com/74425213/204051328-4019737d-d25b-413c-888d-865de0aa627f.png)
