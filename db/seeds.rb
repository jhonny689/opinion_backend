require 'faker'

User.destroy_all
SurveyCategory.destroy_all
QuestionType.destroy_all
Survey.destroy_all
Question.destroy_all



# ---------------------------------- SURVEY CATEGORIES --------------------------------------

SurveyCategory.create(name: "Film/TV", description: "Survey about movies and tv shows")
SurveyCategory.create(name: "Music", description: "Survey about music")
SurveyCategory.create(name: "Celebrities", description: "Survey about famous people")
SurveyCategory.create(name: "Books", description: "Survey about good brain boosters")
SurveyCategory.create(name: "Politics", description: "Shady territory")

# ----------------------------------- QUESTION TYPES ---------------------------------------

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

# ---------------------------------- USERS --------------------------------------------------

roy = User.create(first_name: "Roy", last_name: "Flores", dob: DateTime.new(1990,9,25), email: "royfloresnyc@gmail.com", role: "admin")
glen_coco = User.create(first_name: "Glen", last_name: "Coco", dob: DateTime.new(2004,4,30), email: "4forGlenCoco@gmail.com", role: "admin")
jhonny = User.create(first_name: "Jhonny", last_name: "Chamoun", dob: DateTime.new(1989,9,16), email: "emailaddress@gmail.com", role: "admin")
User.create(first_name: "Some", last_name: "Person", dob: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'), email: "someEmail@gmail.com", role: "surveyee")
10.times do 
    User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , dob: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'), email: Faker::Internet.email, role: "surveyee")
end 

5.times do 
    User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , dob: Faker::Date.between(from: '1980-01-01', to: '2000-12-31'), email: Faker::Internet.email, role: "admin")
end 

admins = User.all.filter {|user| user.role == "admin"}.map {|admin| admin.id}

# ---------------------------------- SAMPLE SURVEYS -----------------------------------------

Survey.create(title: "New Horror Flick", status: "published", due_date: DateTime.new(2020,10,5), description: "Horror movies people saw recently", user_id: jhonny.id, survey_category_id: SurveyCategory.first.id )
Survey.create(title: "Kpop pop pop", status: "draft", due_date: DateTime.new(2020,10,5), description: "Best Kpop Groups in Categories", user_id: jhonny.id, survey_category_id: SurveyCategory.second.id )
Survey.create(title: "Female Rap", status: "published", due_date: DateTime.new(2020,10,3), description: "Popular rap songs by female artists", user_id: roy.id, survey_category_id: SurveyCategory.second.id )
Survey.create(title: "Celeb Couples", status: "draft", due_date: DateTime.new(2020,10,06), description: "Celeb couple who are darn too cute", user_id: roy.id, survey_category_id: SurveyCategory.third.id )
Survey.create(title: "Who's your Celeb Persona", status: "draft", due_date: DateTime.new(2020,10,05), description: "Find out who your celeb persona is", user_id: jhonny.id, survey_category_id: SurveyCategory.third.id )
Survey.create(title: "Your Current Book Addiction", status: "closed", due_date: DateTime.new(2020,9,25), description: "Tell us about the book you can't stop reading", user_id: jhonny.id, survey_category_id: SurveyCategory.fourth.id )
Survey.create(title: "Who's Your President?", status: "closed", due_date: DateTime.new(2020,9,15), description: "Who are you voting for this coming election", user_id: jhonny.id, survey_category_id: SurveyCategory.fifth.id )

20.times do 
    Survey.create(title: [Faker::Book.title, Faker::Movie.title].sample, status: ["published", "draft", "closed"].sample , due_date: Faker::Date.between(from: '2020-09-25', to: '2020-10-15'), description: Faker::TvShows::RuPaul.quote, user_id: admins.sample, survey_category_id: SurveyCategory.all.sample.id )
end 

# ----------------------------------SURVEY QUESTIONS ---------------------------------------
#Horor Flick
Question.create(survey: Survey.first, question_type: QuestionType.all[6], question_text: "Title of a Horror film you saw recently")
Question.create(survey: Survey.first, question_type: QuestionType.all[5], question_text: "How would you classify this horror film?", choices: "Slasher, Psychological Horror, Science Fiction Horror, Supernatural Horror, Zombie Film")
Question.create(survey: Survey.first, question_type: QuestionType.first, question_text: "Where did you see this movie?", choices: "Movie Theatre, Drive-In Movie Theatre, Television, Online")
Question.create(survey: Survey.first, question_type: QuestionType.second, question_text: "Did you enjoy this movie?", choices: "Yes, No")
Question.create(survey: Survey.first, question_type: QuestionType.third, question_text: "What did you enjoy about this movie? (select as many as you want)", choices: "Cinematography, Characters, Monster/Villain's Backstory, Trademark Murder Weapon, Element of Surprise, Appropriate Theme Music")
Question.create(survey: Survey.first, question_type: QuestionType.all[7], question_text: "How would you rank the following: (1 being the best)", choices: "Cinematography, Characters, Monster/Villain's Backstory, Trademark Murder Weapon, Element of Surprise, Appropriate Theme Music")
Question.create(survey: Survey.first, question_type: QuestionType.fourth, question_text: "How would you rate this movie?")
Question.create(survey: Survey.first, question_type: QuestionType.all[9], question_text: "How would you rate the ending of this movie?")
Question.create(survey: Survey.first, question_type: QuestionType.fifth, question_text: "Would you recommend this movie to your friends/family?", choices: "Strongly Disagree, Disagree, Neutral, Agree, Strongly Agree")

#Kpop pop pop
choices1 = []
4.times { choices1 << Faker::Kpop.i_groups }
Question.create(survey: Survey.second, question_type: QuestionType.first, question_text: "Best 1990's OG group", choices: choices1.join(', ') )

choices2 = []
4.times { choices2 << Faker::Kpop.ii_groups }
Question.create(survey: Survey.second, question_type: QuestionType.third, question_text: "Best 2000's group", choices: choices2.join(', '))

choices3 = []
4.times { choices3 << Faker::Kpop.iii_groups }
Question.create(survey: Survey.second, question_type: QuestionType.all[5], question_text: "Best 2010's group", choices: choices3.join(', '))

choices4 = []
4.times { choices4 << Faker::Kpop.girl_groups }
Question.create(survey: Survey.second, question_type: QuestionType.first, question_text: "Best Girl Group", choices: choices4.join(', '))

choices5 = []
4.times { choices5 << Faker::Kpop.boy_bands }
Question.create(survey: Survey.second, question_type: QuestionType.third, question_text: "Best boy band", choices: choices5.join(', '))

choices6 = []
4.times { choices6 << Faker::Kpop.solo }
Question.create(survey: Survey.second, question_type: QuestionType.all[5], question_text: "Best solo artist", choices: choices6.join(', '))

# ---------------------------------- RESPONSES -----------------------------------------

surveyees = User.all.filter {|user| user.role == "surveyee"}

surveyees.each do |surveyee|
    Survey.first.questions.each do |question|
        if question.question_type.name == "Open Ended"
            value = ["Get Out", "Scary Stories", "It", "Annabelle"].sample
        elsif question.question_type.name == "Multiple Answers"
            choices = question.choices.split(', ')
            value = choices.slice(0, rand(0..5)).to_json
        elsif question.question_type.name == "Ranking"
            choices = question.choices.split(', ')
            choices = choices.shuffle
            respHash = Hash.new 
            choices.each_with_index { |item, index|
                respHash[item] = index
            }
            value = respHash.to_json
        elsif question.question_type.name == "Rating Scale"
            value = rand(1..10).to_s
        elsif question.question_type.name == "Slider" 
            value = rand(1..100).to_s 
        else 
            value = question.choices.split(', ').sample
        end
        Response.create(user_id: surveyee.id, question_id: question.id, value: value)
    end 
end 

