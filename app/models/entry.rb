class Entry < ActiveRecord::Base
  before_save :replace_new_lines

  validates_presence_of :contents
  validates_presence_of :title

  has_many :entry_categories, dependent: :destroy
  has_many :categories, through: :entry_categories

  def date
    Writings::Date.new( year, month, day ).to_s
  end

  protected

  def replace_new_lines
    contents.gsub!( /\r\n/, "<br>" )
  end

end
