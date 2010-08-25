class Member < ActiveRecord::Base
  validates_presence_of :name
  has_attached_file :avatar, :default_url => '/system/avatars/missing/missing.png'
  validates_attachment_content_type :avatar, :content_type => [ 'image/jpeg', 'image/png', 'image/tiff', 'image/gif' ],
                                      :message => 'file must be a picture!'
  has_many :memberships
  has_many :visits
  has_many :plans, :through => :memberships do
    def primary
      first
    end
  end

  def primary_plan_name
    plans.primary.name
  rescue
    ""
  end
  
  def primary_plan_id
    plans.primary.id
  rescue
    nil
  end
end
