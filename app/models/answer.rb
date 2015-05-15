class Answer < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates_presence_of :task, :user
  validate :task_active, on: :create

  after_create :update_balances

  def task_active
    # Lock?
    errors.add :base, "Task is not active" unless task.reload.active
  end

  def update_balances
    task.answered()
    user.answered(task)
  end

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
