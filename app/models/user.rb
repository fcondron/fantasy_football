class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about_me, :location, :team, :forem_admin

  has_many :teams, :dependent => :destroy
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy

  validates :about_me, :length => { :maximum => 500 }
  validates :email, :presence => true
  validates :username, :presence => true

  def admin?
    true if self.username == 'admin'
  end

end
