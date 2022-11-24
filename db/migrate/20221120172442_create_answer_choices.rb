class CreateAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.string :content
      t.boolean :correct_answer
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
