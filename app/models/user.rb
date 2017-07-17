class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :tasks
  has_many :chores, through: :tasks


  ROLES = %i[admin author]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def confirmed_friends=
    @confirmed_friends = nil
  end

  def confirmed_friends
    @confirmed_friends
  end


end
