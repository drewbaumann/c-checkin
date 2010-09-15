class Visit < ActiveRecord::Base
  belongs_to :member
  
  validates_numericality_of :coloft_id, :on => :create
  validates_presence_of :coloft_id
  
  start_date = Date.parse "#{Date.today.year}-#{Date.today.month}-01"
  end_date = Date.civil(Date.today.year, Date.today.month, -1)
  
  named_scope :this_month, lambda{{:conditions =>['"visits".created_at BETWEEN ? AND ?',start_date,end_date]}}
  named_scope :recent, :order => "created_at DESC"
  
  start_time_hour = DateTime.civil(DateTime.now.utc.year,DateTime.now.utc.month,DateTime.now.day,15)
  end_time_hour = DateTime.civil(DateTime.now.year,DateTime.now.month,DateTime.now.day+1,2) 
  
  named_scope :today, lambda{{:conditions =>['"visits".created_at BETWEEN ? AND ?',start_time_hour,end_time_hour]}}
  
  def local_time
    created_at.in_time_zone('Pacific Time (US & Canada)')
  end
  
  def short_local_time
    local_time.strftime("%I:%M %p")
  end
  
  def visit_hour
    local_time.strftime("%I")
  end
    
end
