class Task < ApplicationRecord
  belongs_to :user
  has_many :pomodoros, dependent: :destroy

  def self.current
    Task.where(current: true).first
  end

  def not_current!
    update_attribute(:current, false)
  end

  def current!
    current_task = user.tasks.current
    current_task.not_current! if current_task
    update_attribute(:current, true)
  end

  def self.unnamed(user_id)
    task = Task.create(name: 'Nameless activity', user_id: user_id, current: true)
    User.find(user_id).tasks << task
  end

  def time_overview
    total = 0
    pomodoros.each do |p|
      total += p.duration
    end
    total
  end
end
