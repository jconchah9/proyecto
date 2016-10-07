class Calendar < ApplicationRecord
  include AASM

  belongs_to :study

  validates :visit_date, presence: true
  validate :start_must_be_after_today

  scope :ordencalendario, -> { order('created_at ASC') }

  aasm column: 'state' do
    state :en_curso, initial: true
    state :modificada
    state :finalizada
    state :rechazada

    event :modificar do
      transitions from: [:en_curso], to: [:modificada]
    end
    event :finalizar do
      transitions from: [:en_curso, :modificada], to: [:finalizada]
    end
    event :rechazar do
      transitions from: [:en_curso, :modificada], to: [:rechazada]
    end
  end

  def start_must_be_after_today
    errors.add(:visit_date, "tiene que ser una fecha mayor de la actual") unless visit_date > Date.today
  end
end
