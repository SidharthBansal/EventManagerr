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
  
  
  validate :picture_size

  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
