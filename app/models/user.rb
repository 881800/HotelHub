class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :reservations
  
  # Optionally, you can add custom validations
  validate :password_complexity

  def is_admin?
     true 
  end


  private

  def password_complexity
    return if password.blank?

    if password !~ /^(?=.*[a-zA-Z])(?=.*\d).+$/
      errors.add :password, 'Password must include at least one letter and one digit'
    end
    
  end
end
