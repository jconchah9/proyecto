class Company < ApplicationRecord
  has_many :accounts
  has_many :plants

  validates_presence_of :name, :commercial_business, :rut
  validates_uniqueness_of :rut
  validates :name, :commercial_business, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "debe ser solo letras"}
  validate :is_rut_valid?

  def is_rut_valid?
   errors.add(:rut, "invalido") unless rut.rut_valid?
  end
end
