class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :entry_categories, dependent: :destroy
  has_many :entries, through: :entry_categories

end
