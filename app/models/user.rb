class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    #大きな画像を撮るためにURLを指定。facebookユーザのidを指定する必要があるので、上記のuidから。
    user.image = "http://graph.facebook.com/#{auth.uid}/picture?type=large" # assuming the user model has an image
  end
end
end
