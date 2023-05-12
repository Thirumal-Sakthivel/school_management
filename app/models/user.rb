class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  belongs_to :school, optional: true

  scope :admins, -> { includes(:roles).where(roles: { name: 'admin' }) }
  scope :students, -> { includes(:roles).where(roles: { name: 'student' }) }
  scope :all_shool_admins, -> { includes(:roles).where(roles: { name: 'school_admin' }) }
  scope :school_admins, ->(school_id) { includes(:roles).where(school_id: school_id, roles: { name: 'school_admin' }) }
  scope :school_students, ->(school_id) { includes(:roles).where(school_id: school_id, roles: { name: 'student' }) }

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
