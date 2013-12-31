class Point < ActiveRecord::Base
  belongs_to :goal
  validates :quantity, presence: true, numericality: true
end
