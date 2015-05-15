class Answer < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates_presence_of :task, :user

  def self.user(user_id)
    where("answers.user_id = ?", user_id)
  end

  def self.not_user(user_id)
    where("answers.user_id <> ?", user_id)
  end

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
