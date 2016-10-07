class Contract < ApplicationRecord
  belongs_to :company
  belongs_to :acceptance
  has_one :detail_contract

  accepts_nested_attributes_for :company
  validates :start_date, :end_date, presence: true
  validate :start_must_be_before_end_date
  validate :start_must_be_after_today

  private

  def start_must_be_before_end_date
    errors.add(:start_date, "debe ser antes de la fecha de finalización") unless start_date < end_date
  end

  def start_must_be_after_today
    errors.add(:start_date, "tiene que ser una fecha mayor de la actual") unless start_date > Date.today
  end
end
