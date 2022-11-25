class RolifyCreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :name, null: false

      t.timestamps
    end
  end
end
