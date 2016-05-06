class Question < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  acts_as_votable

  validates :content, presence: true

  def score
    self.get_upvotes.size
  end
end
