class ResponsesController < ApplicationController
    def index
        responses = Response.all 
        if params[:survey]
            responses = Survey.find(params[:survey]).responses
        end
        render json: ResponseSerializer.new(responses)
    end 

    def create
        if params["answers"]
            params.permit!
            params["answers"].each{|ans| Response.create(ans)}
        end
        render json: {response: "saved"}

    end
end

# "answers"=>[
#     {"user_id"=>3, "question_id"=>"1", "value"=>"horooor"}, 
#     {"user_id"=>3, "question_id"=>"2", "value"=>"Slasher"}, 
#     {"user_id"=>3, "question_id"=>"3", "value"=>"Online"}, 
#     {"user_id"=>3, "question_id"=>"4", "value"=>"Yes"}, 
#     {"user_id"=>3, "question_id"=>"5", "value"=>["Monster/Villain's Backstory", "Trademark Murder Weapon", "Element of Surprise"]},
#     {"user_id"=>3, "question_id"=>"6", "value"=>{"Cinematography"=>6, "Characters"=>5, "Monster/Villain's Backstory"=>4, "Trademark Murder Weapon"=>3, "Element of Surprise"=>2, "Appropriate Theme Music"=>1}},
#     {"user_id"=>3, "question_id"=>"7", "value"=>"9"},
#     {"user_id"=>3, "question_id"=>"8", "value"=>"28"}, 
#     {"user_id"=>3, "question_id"=>"9", "value"=>"Agree"}]
