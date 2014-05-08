require 'spec_helper'

describe Entry do

  it { should validate_presence_of :contents }
  it { should validate_presence_of :title }
  it { should validate_presence_of :book }

  it { should have_many( :entry_categories ).dependent( :destroy ) }
  it { should have_many( :categories ).through( :entry_categories ) }
  it { should belong_to( :book ) }

  it 'has a valid factory' do
    FactoryGirl.build( :entry ).should be_valid
  end

end
