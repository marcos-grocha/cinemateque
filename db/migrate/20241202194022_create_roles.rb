class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :description, null: false
      t.references :actor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
