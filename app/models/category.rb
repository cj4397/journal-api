class Category < ApplicationRecord
  belongs_to :user
  has_many :task,  dependent: :destroy
  validates :name, presence: true, uniqueness:true
  
end
