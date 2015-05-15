class User < ActiveRecord::Base
  has_many :tasks
  has_many :answers

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
