class User < ActiveRecord::Base
  
  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
  
  has_secure_password
  has_many :tracks, dependent: :destroy
  has_many :goals, through: :tracks
  
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
  
end
