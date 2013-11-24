class User < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :phone, :password, :zip_code, :birthday, :gender, :nsfw
  attr_reader :password
  
  validates :password_digest, :presence => { :messages => "Password can't be blank!" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  validates :phone, :presence => true
  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(phone, password)
    user = User.find_by_phone(phone)
    
    return nil if user.nil?
    
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
=======
  attr_accessible :phone, :gender, :zip_code, :birthday, :nsfw

  has_one :conversation
end
>>>>>>> 2489d88406a75a21198db9d31db2c317501bad88
