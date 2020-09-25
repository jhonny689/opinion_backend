# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# SurveyCategory.destroy_all
# QuestionType.destroy_all
# Survey.destroy_all
# Question.destroy_all

User.create(first_name: "Roy", last_name: "Flores", dob: DateTime.new(1990,9,25), email: "royfloresnyc@gmail.com", role: "admin")
User.create(first_name: "Some", last_name: "Person", dob: DateTime.new(1995,7,1), email: "someEmail@gmail.com", role: "non-admin")

SurveyCategory.create(name: "Customer Satisfaction", description: "some description")

QuestionType.create(name: "Multiple choice", description: "this is multiple choice. duh")
QuestionType.create(name: "True or False", description: "this is true or false")

Survey.create(title: "How Did We Do?", status: "published", due_date: DateTime.new(2020,9,30), description: "some description", user_id: User.first.id, survey_category_id: SurveyCategory.first.id )

Question.create(survey: Survey.first, question_type: QuestionType.first, question_text: "How did you hear about us?", choices: "Online Ad, News paper Ad, Friend Recommendation, Company Recommendation")
Question.create(survey: Survey.first, question_type: QuestionType.first, question_text: "What is your age range?", choices: "18-25, 25-35, 35-45, 45 and older")
Question.create(survey: Survey.first, question_type: QuestionType.second, question_text: "You enjoyed your visit with us today.", choices: "True, False")
Question.create(survey: Survey.first, question_type: QuestionType.first, question_text: "How likely are you to come back?", choices: "Very likely, Maybe, Not very likely")
Question.create(survey: Survey.first, question_type: QuestionType.second, question_text: "We can contact you to follow up on these response.", choices: "True, False")