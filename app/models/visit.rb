class Visit < ActiveRecord::Base
  belongs_to :member
  
  start_date = Date.parse "#{Date.today.year}-#{Date.today.month}-01"
  end_date = Date.civil(Date.today.year, Date.today.month, -1)
  named_scope :this_month, lambda{{:conditions =>['"visits".created_at BETWEEN ? AND ?',start_date,end_date]}}
end
