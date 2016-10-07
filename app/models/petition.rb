class Petition < ApplicationRecord
  include AASM

  belongs_to :client
  has_many :studies

  has_attached_file :request
  accepts_nested_attributes_for :client, reject_if: :all_blank, allow_destroy: true

  validates :request, presence: true

  validates_attachment :request, content_type: {
    content_type: ['application/pdf']
  }

  scope :pendientes, -> { where(state: 'pendiente') }
  scope :vistos, -> { where(state: 'visto') }
  scope :ultimos, -> { order('created_at DESC').limit(10) }

  aasm column: 'state' do
    state :pendiente, initial: true
    state :visto
    event :ver do
      transitions from: [:pendiente], to: [:visto]
    end
    event :regresar do
      transitions from: [:visto], to: [:pendiente]
    end
  end
end
