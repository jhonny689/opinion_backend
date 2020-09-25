class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.belongs_to :survey, null: false, foreign_key: true
      t.belongs_to :question_type, null: false, foreign_key: true
      t.string :question_text
      t.string :choices

      t.timestamps
    end
  end
end
