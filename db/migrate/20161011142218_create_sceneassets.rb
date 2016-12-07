class CreateSceneassets < ActiveRecord::Migration
  def change
    create_table :sceneassets do |t|
      t.string :assetname
      t.string :location
      t.string :text
      t.references :vrscene, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
