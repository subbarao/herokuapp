class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.references :party, index: true
      t.string :candidate
      t.integer :votes
      t.references :seat, index: true

      t.timestamps
    end
  end
end
