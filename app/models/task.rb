class Task < ApplicationRecord
     belongs_to :user
     validates :task, presence: true, uniqueness: { scope: :user_id }
end
