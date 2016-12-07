class CreateVrapps < ActiveRecord::Migration
  def change
    create_table :vrapps do |t|
      t.string :name
      t.text :description
      t.string :tag
      t.integer :scenecount
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
