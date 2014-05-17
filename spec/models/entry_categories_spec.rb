require 'spec_helper'

describe EntryCategory do

  it { should belong_to :entry }
  it { should belong_to :category }

  it { should validate_presence_of :category }

  it 'has a valid factory' do
    FactoryGirl.build( :entry_category ).should be_valid
  end

end
