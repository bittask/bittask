class User < ActiveRecord::Base
  has_many :tasks
  has_many :answers

  before_validation :reset_balance

  validates_presence_of :balance

  def reset_balance
    self.balance = 0
  end

  def address_is_valid
    address && !Bitcoin.valid_address?(address)
  end

  def withdraw
    # Send balance to bitcoin address
    return unless address

    begin
      COINBASE.send_money(address, balance.to_f/100_000_000, "Thanks for using BitTask!")
    rescue Coinbase::Client::Error => e
      # Not enough coins. Need fees to withdraw.
      throw e
    end
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
