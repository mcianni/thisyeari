class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  has_many :goals

  def goal
  	self.goals.first
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(name: auth.info.nickname,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email || "#{auth.uid}@bytheendoftheyear.com",
                         password: Devise.friendly_token[0,20]
                         )
    end
    user
  end

end
