class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :username, :avatar_file_name, :avatar_content_type, :avatar_file_size, 
    :avatar_updated_at

  validates_presence_of :username
  validates_uniqueness_of :username
  has_many :tweets

  has_attached_file :avatar, styles: { :mini => "24x24>", :thumb => "48x48>" }, 
    default_url: '/assets/default_:style.png'
end
