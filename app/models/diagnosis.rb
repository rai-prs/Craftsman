class Diagnosis < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :communication, presence: true
  validates :planning, presence: true
  validates :dexterous, presence: true
  validates :tidy, presence: true
  validates :physically, presence: true
  validates :muscle, presence: true
  validates :intelligence, presence: true
  validates :careful, presence: true
  validates :pride, presence: true
  validates :picky, presence: true
  validates :destruction, presence: true
  validates :narrow, presence: true
  validates :dirt, presence: true
  validates :high, presence: true
end
