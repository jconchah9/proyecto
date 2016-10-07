class Study < ApplicationRecord
  include AASM
  belongs_to :petition
  has_attached_file :feasibility

  # validations
  validates_presence_of :feasibility
  validates_attachment :feasibility, content_type: { content_type: ['application/pdf'] }
  # scope
  scope :ordenadofecha, -> { order('created_at asc') }
  # statemachine
  aasm column: 'state' do
    state :en_analisis, initial: true
    state :aceptado
    state :rechazado
    event :aceptar do
      transitions from: [:en_analisis], to: [:aceptado]
    end
    event :rechazar do
      transitions from: [:en_analisis], to: [:rechazado]
    end
  end
  # end statemachine
end
