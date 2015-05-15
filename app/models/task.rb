class Task < ActiveRecord::Base
  TYPE_MULTIPLE_CHOICE = 1
  TYPE_FREE_FORM = 2

  CALLBACK_URL = "http://bittask.io/callbacks"

  belongs_to :user
  has_many :answers

  before_validation :reset_balance

  validates_presence_of :user, :title, :task_type, :cost, :balance
  validate :choices_validation

  after_save :get_address

  def self.user(user_id)
    where("tasks.user_id = ?", user_id)
  end

  def self.for_user(user)
    Task.user(user.id).order(created_at: :asc)
  end

  def choices_validation
    logger.debug "xcv #{task_type} #{TYPE_MULTIPLE_CHOICE} #{task_type == TYPE_MULTIPLE_CHOICE}"
    if task_type == TYPE_MULTIPLE_CHOICE and (choices.nil? or choices.size < 2)
      logger.debug "asd"
      self.errors.add :base, "You must include at least 2 choices, one per line"
    end
  end

  def reset_balance
    self.balance = 0
  end

  def self.get_latest(user)
    tasks = Answer.select(:task_id).user(user.id)
    # Tasks that user has not answered ordered by descending cost
    Task.where.not(id: tasks).where(active: true).order(cost: :desc).first
  end

  def type_string
    case task_type
    when TYPE_MULTIPLE_CHOICE
      "Multiple choice"
    when TYPE_FREE_FORM
      "Free response"
    end
  end

  def is_multiple_choice?
    task_type == TYPE_MULTIPLE_CHOICE
  end

  def get_address
    return if address
    # Do this async?
    update_column(:address, COINBASE.generate_receive_address({address: {label: "Task #{id}", callback_url: CALLBACK_URL}}).address)
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
