class AddAttachmentThumbnailToVrapps < ActiveRecord::Migration
  def self.up
    change_table :vrapps do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :vrapps, :thumbnail
  end
end
