class Entry < ActiveRecord::Base
  validates_presence_of :contents
  validates_presence_of :title

  before_save :replace_new_lines

  def date
    Writings::Date.new( year, month, day ).to_s
  end

  protected

  def replace_new_lines
    contents.gsub!( /\r\n/, "<br>" )
  end

end
