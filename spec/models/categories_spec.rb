require 'spec_helper'

describe Category do

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should have_many( :entry_categories ).dependent( :destroy ) }
  it { should have_many( :entries ).through( :entry_categories ) }

  it 'has a valid factory' do
    FactoryGirl.build( :category ).should be_valid
  end

end
