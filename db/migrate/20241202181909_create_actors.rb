class CreateActors < ActiveRecord::Migration[8.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :nationality

      t.timestamps
    end
  end
end
