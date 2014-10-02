class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook, :google_oauth2]

  has_many :goals

  def goal
  	self.goals.first
  end

  def self.find_for_oauth(auth, signed_in_resource=nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      name = auth.provider == 'twitter' ? auth.info.nickname : auth.info.name
      user = User.create(name: name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email || "#{auth.uid}@thisyeari.com",
                         password: Devise.friendly_token[0,20]
                         )
    end
    user
  end

end
