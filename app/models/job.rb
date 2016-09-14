class Job < ApplicationRecord
  belongs_to :department
  has_many :candidates, dependent: :destroy
end
