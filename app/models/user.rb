class User < ActiveRecord::Base
  has_many :tasks
  has_many :answers

  validates_presence_of :balance

  def answered(task)
    increment!(:balance, task.cost)
  end

  def to_s
    "#{id}"
  end

  def serializable_hash(options)
    {
      id: id,
      address: address,
      balance: balance
    }
  end
end
