class ChangeBirthdateToBeDateInActors < ActiveRecord::Migration[8.0]
  def change
    change_column :actors, :date_of_birth, :date
  end
end
