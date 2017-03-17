class Listing < ApplicationRecord
  belongs_to :user

  #リスティングは多数の写真を持つことができる。
  has_many :photos

  #必須項目
  validates :home_type, presence: true
  validates :pet_type, presence: true
  validates :pet_size, presence: true
  validates :breeding_years, presence: true

end
