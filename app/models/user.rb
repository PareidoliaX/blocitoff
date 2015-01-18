class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_one :list
  
  after_create :user_list
  
  private 
  
  def user_list
    List.create(user: self, title: 'My Todo List')
  end
    
end
