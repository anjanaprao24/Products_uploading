class Product < ActiveRecord::Base
  validates :title , :presence => true
  validates :description , :presence => true
  validates :price , :presence =>true
  validates :product , :presence=>true
  has_attached_file :pic, :styles =>
      { :medium => "500x500>", :thumb => "100x100>" }

  do_not_validate_attachment_file_type :pic
  belongs_to :category
  has_many :brands
end
