class User < ApplicationRecord
  include PermissionsConcern

  has_many :accounts


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
