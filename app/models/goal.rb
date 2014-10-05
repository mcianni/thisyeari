class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :points
  before_validation :set_quantity
  validates :user_id, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: true
  validates :quantity, numericality: true
  validate  :quantity_must_be_numerical

  private
  def set_quantity
    self.quantity = nil
    matches = self.description.scan(/\d+/)
    if matches.count == 1
      self.quantity = matches[0].to_f
    end
  end

  def quantity_must_be_numerical
    if quantity.present? && quantity <= 0
      errors.add(:description, 'must have a positive quantity')
    end
  end
end
