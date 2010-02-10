class Snippet < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :subcategory
  belongs_to :category
  validates_presence_of :name

  # faking acts_as_paranoid since its no longer supported
  # note: this breaks before_delete call backs, but since we aren't using them...
  default_scope :conditions => {:deleted_at => nil}
  
  def to_s
    name
  end


  def delete
    images.each do |image|
      image.destroy
    end
    self.update_attribute(:deleted_at, Time.zone.now)
  end

  def deleted?
    !!self.deleted_at
  end
end
