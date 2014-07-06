class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password,                length: { minimum: 6, too_short: "is too short, it needs to be at least 6 characters" },
                                      confirmation: true,
                                      presence: true, :on => :create

  validates :password_confirmation,   presence: true

  validates :email,                   uniqueness: true,
                                      email: true,
                                      presence: true
                                      
end
