class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  def full_name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end

  def role_names
    roles.pluck(:name)
  end

  def admin?
    role_names.include?('admin')
  end

  def student?
    role_names.include?('student')
  end

  def school_admin?
    role_names.include?('school_admin')
  end
end
