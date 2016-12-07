class Vrscene < ActiveRecord::Base
  belongs_to :vrapp
  has_many :sceneassets

  has_attached_file :scene_img, styles: { large: "8000x4000#", medium: "400x200#" }
  validates_attachment_content_type :scene_img, content_type: /\Aimage\/.*\z/
end
