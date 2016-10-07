class Client < ApplicationRecord
  has_one :petitions

  validates :telephone, presence: true, numericality: true, length: { minimum: 9, maximum: 12 }
  validates_presence_of :email, :name ,:enterprise
  validates :email, :email_format => { :message => 'debe tener formato correcto' }
  validates :name, :enterprise, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "debe ser solo letras"}
end
