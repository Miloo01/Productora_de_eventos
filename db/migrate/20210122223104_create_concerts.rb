class CreateConcerts < ActiveRecord::Migration[5.2]
  def change
    create_table :concerts do |t|
      t.date :date
      t.string :place
      t.integer :participants
      t.references :group, foreign_key: true 

      t.timestamps
    end
  end
end
