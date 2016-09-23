class Job < ApplicationRecord
  belongs_to :department
  belongs_to :company
  has_many :candidates, dependent: :destroy

  def start_time
   self.job.projected_start_date
  end
end
