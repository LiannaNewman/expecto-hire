class Candidate < ApplicationRecord
  belongs_to :job
  mount_uploader :resume, CandidateResumeUploader
  mount_uploader :cover_letter, CandidateCoverLetterUploader
  mount_uploader :references, CandidateReferencesUploader
end
