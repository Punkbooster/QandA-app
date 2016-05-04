class Event < ActiveRecord::Base
  has_many :questions, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
end
