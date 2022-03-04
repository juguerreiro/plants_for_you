class Plant < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many :users, through: :sales
  has_one_attached :photo
end
