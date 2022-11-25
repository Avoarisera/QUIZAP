class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.jsonb :answered_question, default: {}
      t.integer :score
      t.references :user, foreign_key: true
      t.references :quizz, foreign_key: true

      t.timestamps
    end
  end
end
