class CreateQuestionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :question_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
