# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
SurveyCategory.destroy_all
QuestionType.destroy_all
Survey.destroy_all
Question.destroy_all

User.create(first_name: "Roy", last_name: "Flores", dob: DateTime.new(1990,9,25), email: "royfloresnyc@gmail.com", role: "admin")
User.create(first_name: "Jhonny", last_name: "Chamoun", dob: DateTime.new(1989,9,16), email: "emailaddress@gmail.com", role: "admin")
User.create(first_name: "Some", last_name: "Person", dob: DateTime.new(1995,7,1), email: "someEmail@gmail.com", role: "non-admin")

SurveyCategory.create(name: "Film/TV", description: "Survey about movies and tv shows")
SurveyCategory.create(name: "Music", description: "Survey about music")
SurveyCategory.create(name: "Celebrities", description: "Survey about famous people")
SurveyCategory.create(name: "Books", description: "Survey about good brain boosters")
SurveyCategory.create(name: "Politics", description: "Shady territory")

QuestionType.create(name: "Single Answer", description: "Surveyee can only select one from the given choices.")
QuestionType.create(name: "Yes Or No", description: "Surveyee can select between the two options.")
QuestionType.create(name: "Multiple Answers", description: "Surveyee can select multiple answers.")
QuestionType.create(name: "Rating Scale", description: "Numerical Rating Scale.")
QuestionType.create(name: "Likert Scale", description: "Choices range from Strongly Agree to Strongly Disagree.")
QuestionType.create(name: "Drop Down", description: "Options will be presented in a drop down menu.")
QuestionType.create(name: "Open Ended", description: "Surveyee can input their own response.")
QuestionType.create(name: "Ranking", description: "Surveyee can rank the given options form highest to lowest.")
QuestionType.create(name: "Image Choice", description: "Surveyee choose one answer from a list of images.")
QuestionType.create(name: "Slider", description: "Surveyee can rate an answer option on a numerical scale by dragging a slider.")

Survey.create(title: "New Horror Flick", status: "published", due_date: DateTime.new(2020,9,30), description: "Horror movies people saw recently", user_id: User.first.id, survey_category_id: SurveyCategory.first.id )

Question.create(survey: Survey.first, question_type: QuestionType.all[6], question_text: "Title of a Horror film you saw recently")
Question.create(survey: Survey.first, question_type: QuestionType.all[5], question_text: "How would you classify this horror film?", choices: "Slasher, Psychological Horror, Science Fiction Horror, Supernatural Horror, Zombie Film")
Question.create(survey: Survey.first, question_type: QuestionType.first, question_text: "Where did you see this movie?", choices: "Movie Theatre, Drive-In Movie Theatre, Television, Online")
Question.create(survey: Survey.first, question_type: QuestionType.second, question_text: "Did you enjoy this movie?")
Question.create(survey: Survey.first, question_type: QuestionType.third, question_text: "What did you enjoy about this movie? (select as many as you want)", choices: "Cinematography, Characters, Monster/Villain's Backstory, Trademark Murder Weapon, Element of Surprise, Appropriate Theme Music")
Question.create(survey: Survey.first, question_type: QuestionType.all[7], question_text: "How would you rank the following: (1 being the best)", choices: "Cinematography, Characters, Monster/Villain's Backstory, Trademark Murder Weapon, Element of Surprise, Appropriate Theme Music")
Question.create(survey: Survey.first, question_type: QuestionType.fourth, question_text: "How would you rate this movie?")
Question.create(survey: Survey.first, question_type: QuestionType.all[9], question_text: "How would you rate the ending of this movie?")
Question.create(survey: Survey.first, question_type: QuestionType.fifth, question_text: "Would you recommend this movie to your friends/family?")
