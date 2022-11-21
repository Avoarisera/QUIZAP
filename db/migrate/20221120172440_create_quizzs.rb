class CreateQuizzs < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzs do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
