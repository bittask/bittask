class Answer < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  def to_s
    a = choice.present? ? "#{choice}" : text
    "#{user}: #{a}"
  end

  def serializable_hash(options)
    {
      id: id,
      task_id: task_id,
      user_id: user_id,
      choice: choice,
      text: text
    }
  end
end
