class DocumentAnalysis < ApplicationRecord
  belongs_to :analysis

  validates_presence_of  :name, :descripcion, :document

  has_attached_file :document
  validates_attachment :document, content_type: {
    content_type: ['application/pdf', 'image/jpeg']
  }
end
