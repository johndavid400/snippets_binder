class Subcategory < ActiveRecord::Base
  has_many :snippets
  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
end

