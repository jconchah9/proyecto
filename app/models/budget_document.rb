class BudgetDocument < ApplicationRecord
  belongs_to :budget
  has_attached_file :document

  accepts_nested_attributes_for :budget

  validates_presence_of :name, :description, :document

  validates_attachment :document, content_type: {
    content_type: ['application/vnd.ms-excel',
                   'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']
  }
end
