class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hosted_events,  class_name: "Event",
                            foreign_key: "host_id",
                            dependent: :destroy,
                            source: :host

  has_many :invitations, class_name: "Event",
                         foreign_key: "guest_id",
                         dependent: :destroy,
                         source: :guests

  has_and_belongs_to_many :events
  
  mount_uploader :picture, PictureUploader

end
