class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :type
      t.string :name
      t.references :district, index: true

      t.timestamps
    end
  end
end
