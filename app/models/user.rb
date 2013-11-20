class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  					:first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates :first_name, presence: true 
  validates :last_name, presence: true
  validates :profile_name, presence: true, uniqueness: true,length: {minimum: 4},
                         format: {
                            with: /^[a-zA-Z \.'\-]+$/,
                            message: "Must be formatted correctly"
                         } 


  has_many :statuses 
  has_many :authentications

  def full_name
  	first_name + " " + last_name
  end

  def twitter_client
    authentications.where(provider: "twitter").first.twitter_client
  end

  def gravatar_url #adding gravatar and making a method
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}"
  end
end
