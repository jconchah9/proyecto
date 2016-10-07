class Analysis < ApplicationRecord
  include AASM
  belongs_to :calendar

  validates :summary, presence: true

  aasm column: 'state' do
    state :en_curso, initial: true
    state :aceptada
    state :rechazada
    event :aceptar do
      transitions from: [:en_curso], to: [:aceptada]
    end
    event :rechazar do
      transitions from: [:en_curso], to: [:rechazada]
    end
  end
end
