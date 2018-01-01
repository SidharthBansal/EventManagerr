class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :event
    
     default_scope { order(created_at: :desc) }
    
    validates :body, presence: true
    validates :user_id, presence: true
    validates :event_id, presence: true
end
