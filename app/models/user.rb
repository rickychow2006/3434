class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6} , allow_nil: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_initialize :ensure_session_token
  
  attr_reader :password
  
  has_many :messages,
  foreign_key: :user_id,
  class_name: :Message
  
  has_many :memberships,
  foreign_key: :user_id,
  class_name: :Membership
  # :dependant => :delete_all
  
  has_many :started_channels,
  foreign_key: :admin_id,
  class_name: :Channel
  
  has_many :channels,
      through: :memberships,
      source: :channel

  def self.find_by_credentials(email, password)
      @user = User.find_by(email: email)
      @user && @user.is_password?(password) ? @user : nil
  end

  def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
      self.session_token = SecureRandom.urlsafe_base64(16)
      self.save!
      self.session_token
  end

  def ensure_session_token
      self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  # def ensure_global_subscription
  #     if self.memberships.length == 0
  #         global_id = Channel.find_by(name: "Global")
  #         Membership.create({user_id: self.id, channel_id: global_id})
  #     end
  # end

end
