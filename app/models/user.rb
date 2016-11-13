class User < ActiveRecord::Base
  has_many :slides

  enum role: [:default, :admin]

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid      = auth['uid']
      user.name     = auth['info']['name']
      user.github   = auth['info']['urls']['GitHub']
    end
  end
end
