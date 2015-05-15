class Task < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  TYPE_MULTIPLE_CHOICE = 1
  TYPE_FREE_FORM = 2

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
