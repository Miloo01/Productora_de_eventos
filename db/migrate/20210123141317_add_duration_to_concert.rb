class AddDurationToConcert < ActiveRecord::Migration[5.2]
  def change
    add_column :concerts, :duration, :integer
  end
end
