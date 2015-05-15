class User < ActiveRecord::Base
  has_many :tasks
  has_many :answers

  def to_s
    "#{id}"
  end
end
