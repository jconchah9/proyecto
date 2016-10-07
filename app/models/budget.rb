class Budget < ApplicationRecord
  include AASM
  belongs_to :analysis
  has_one :budget_document

  validates_presence_of :summary

  aasm column: 'state' do
    state :en_curso, initial: true
    state :enviado
    state :aceptado
    state :rechazado

    event :enviar do
      transitions from: [:en_curso], to: [:enviado]
    end
    event :aceptar do
      transitions from: [:enviado], to: [:aceptado]
    end
    event :rechazar do
      transitions from: [:enviado, :en_curso], to: [:rechazado]
    end
  end
end
