class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :invitations, class_name: "Event",
                        foreign_key: "host_id",
                        dependent: :destroy

 has_many :invites,  class_name: "Event",
                     foreign_key: "guest_id",
                     dependent: :destroy

 has_many :guests, through: :invitations, source: :guest
 has_many :hosts, through: :invites, source: :host


end
