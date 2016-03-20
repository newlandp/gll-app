class Track < ActiveRecord::Base
  belongs_to :goal
  belongs_to :users
  has_many :days, through: :goal
  
  def complete_day
    if self.days_completed == ""
      self.days_completed = self.days_completed + "#{self.current_day}"
    else
      self.days_completed = self.days_completed + " #{self.current_day}"
    end
    
    self.current_day += 1
    self.save
  end
  
  def completed_days
    days_completed_array = self.days_completed.split(" ")
    days_completed_array.map do |s|
      s.to_i
    end
  end
  
  def completed_day_objects
    a = self.completed_days
    days = self.days
    
    a.map do |day|
      day = days.find_by(number: day)
    end
    
  end
  
  def percent_complete
    if self.completed_days.size == 0
      0
    else
      percent = ((self.completed_days.size.to_f / self.days.count.to_f) * 100).round
    end
  end
  
  def upcoming_days
    a = []
    now = self.current_day + 1
    days = self.days
    last = days.count
    
    for i in now..last
      a.push(i)
    end
    
    a.map do |day|
      day = days.find_by(number: day)
    end
  end
  
  def current_day_object
    day_num = self.current_day
    days = self.days
    
    day = days.find_by(number: day_num)
  end
  
end
