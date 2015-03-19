class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  before_save :encrypt_password
  validates :email, :presence => true
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
