class CreateVrscenes < ActiveRecord::Migration
  def change
    create_table :vrscenes do |t|
      t.string :scenename
      t.integer :orderid
      t.string :scenetype
      t.references :vrapp, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
