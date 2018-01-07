class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :hosted_events,  class_name: "Event",
                            foreign_key: "host_id",
                            dependent: :destroy,
                            source: :host

  has_many :invitations, class_name: "Event",
                         foreign_key: "guest_id",
                         dependent: :destroy,
                         source: :guests

  has_and_belongs_to_many :events
  
  has_many :comments
  
  mount_uploader :picture, PictureUploader
  
  validate :picture_size
  
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
