class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :about

  has_many :entries, dependent: :destroy
end
