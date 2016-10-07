class Acceptance < ApplicationRecord
  include AASM
  belongs_to :budget
  has_one :contract

  validates_presence_of :summary
  
  aasm column: 'state' do
    state :pendiente, initial: true
    state :aceptado
    state :rechazado
    event :aceptar do
      transitions from: [:pendiente], to: [:aceptado]
    end
    event :rechazar do
      transitions from: [:pendiente], to: [:rechazado]
    end
  end
end
