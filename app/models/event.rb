class Event < ApplicationRecord

  belongs_to :host, class_name: "User"

  validates :title, presence: true, length: {minimum: 3, maximum: 150}

  validates :body, presence:true ,length: { minimum: 25, maximum: 2500}

  validates :location, presence:true, length:{ minimum: 3 , maximum: 100}

  validates :date, presence:true
end
