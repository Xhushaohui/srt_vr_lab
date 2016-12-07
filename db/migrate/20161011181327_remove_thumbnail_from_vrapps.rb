class RemoveThumbnailFromVrapps < ActiveRecord::Migration
  def change
    remove_column :vrapps, :thumbnail, :string
  end
end
