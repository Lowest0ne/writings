class EntryCategory < ActiveRecord::Base

  belongs_to :entry
  belongs_to :category

  validates_presence_of :entry
  validates_presence_of :category

end
