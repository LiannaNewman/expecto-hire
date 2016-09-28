class Job < ApplicationRecord
  belongs_to :department
  belongs_to :company
  has_many :candidates, dependent: :destroy

  def start_time
   self.job.projected_start_date
  end

  def new_date_format
    self.job.projected_start_date.to_formatted_s(:long)
  end
end
