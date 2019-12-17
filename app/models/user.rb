class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitive => false}, allow_nil: false
  validates :password, presence: true, length: {minimum: 3}
  validates :password_confirmation, presence: true, length: {minimum: 3}

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where("lower(email) = ?", email.downcase).first
    if (user && user.authenticate(password))
      return user
    end
    nil
  end


end
