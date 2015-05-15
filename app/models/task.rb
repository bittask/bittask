class Task < ActiveRecord::Base
  TYPE_MULTIPLE_CHOICE = 1
  TYPE_FREE_FORM = 2

  belongs_to :user
  has_many :answers

  before_validation :reset_balance

  validates_presence_of :user, :title, :task_type, :cost, :balance

  after_save :get_address

  def reset_balance
    self.balance = 0
  end

  def get_address
    return if address
    update_column(:address, COINBASE.generate_receive_address({address: {label: "Task #{id}"}}).address)
  end

  def increase_balance bal
    increment!(:balance, bal)
    update_active
  end

  def answered
    increment!(:balance, -cost)
    update_active
  end

  def update_active
    if active
      update_column(:active, false) if balance < cost
    else
      update_column(:active, true) if balance >= cost
    end
  end

  def to_s
    txt = []
    txt << "User: #{user}"
    txt << "Task Type: #{task_type}"
    txt << "Cost: #{cost}"
    txt << "Balance: #{balance}"
    txt << "Address: #{address}"
    txt << "Title: #{title}"
    if choices
      choices.each_with_index do |c, i|
        txt << "  #{i}: #{c}"
      end
    end
    txt << "Answers:"
    answers.each do |a|
      txt << "  #{a}"
    end
    txt.join("\n")
  end

  def serializable_hash(options)
    {
      id: id,
      title: title,
      choices: choices,
      cost: cost,
      address: address,
      balance: balance
    }
  end

end
