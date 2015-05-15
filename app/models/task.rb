class Task < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  TYPE_MULTIPLE_CHOICE = 1
  TYPE_FREE_FORM = 2
end
