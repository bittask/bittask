class Task < ActiveRecord::Base
  TYPE_MULTIPLE_CHOICE = 1
  TYPE_FREE_FORM = 2

  belongs_to :user
  has_many :answers

  validates_presence_of :user, :title, :task_type, :cost, :address, :balance

  def add_balance balance
    increment :balance, balance
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
      cost: cost
    }
  end

end
