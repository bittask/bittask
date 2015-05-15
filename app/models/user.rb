class User < ActiveRecord::Base
  has_many :tasks
  has_many :answers

  before_validation :reset_balance

  validates_presence_of :balance

  def reset_balance
    self.balance = 0
  end

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
