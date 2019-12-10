class User < ApplicationRecord
	validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
	validates :introduction, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
def email_required?
   false
 end
 def email_changed?
   false
 end
  has_many :books, dependent: :destroy
  attachment :profile_image
end
