class Event < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
end
