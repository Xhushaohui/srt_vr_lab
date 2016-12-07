class AddAttachmentSceneImgToVrscenes < ActiveRecord::Migration
  def self.up
    change_table :vrscenes do |t|
      t.attachment :scene_img
    end
  end

  def self.down
    remove_attachment :vrscenes, :scene_img
  end
end
