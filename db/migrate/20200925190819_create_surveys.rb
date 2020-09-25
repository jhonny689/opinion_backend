class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :status
      t.datetime :due_date
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
