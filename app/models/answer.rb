class Answer < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  def to_s
    a = choice.present? ? "#{choice}" : text
    "#{user}: #{a}"
  end
end
