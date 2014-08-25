class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  # validates :password, length: {minimum: 3}, on: :create

  # Now I can do User.authenticate("anil@anil.com", "123")
  def self.authenticate email, password
    # user if user and user.authenticate password
    # user = User.find_by_email email
    User.find_by_email(email).try(:authenticate,password)
  end


end
