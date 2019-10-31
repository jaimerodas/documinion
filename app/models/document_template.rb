class DocumentTemplate < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :liquid_text, presence: true
end
