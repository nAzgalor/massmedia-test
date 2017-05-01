class Feedback < ApplicationRecord
  mount_uploader :file, FileUploader
  validates :age, numericality: { only_integer: true }, inclusion: { in: 17..65, 
    message: "%{value} is not a valid size, must be between 17 and 65" }
  validates :name, format: { with: /[a-zA-Z\s]/, message: 'Only letters' }
  validates :date, :name, :age, presence: true
  validate :full_name_validation
  validate :previous_feedback_validation


  private
  def full_name_validation
    if name.split().length != 2 || name.split()[0] != name.split()[0].capitalize || name.split()[1] != name.split()[1].capitalize
      errors.add(:name, "There should be two words with capital letters, separated by a space")
    end
  end

  def previous_feedback_validation
    if previous_id.present? && !Feedback.find_by(id: previous_id)
      errors.add(:base, "Sorry but previous feedback with this number we don't have")
    end
  end
end
