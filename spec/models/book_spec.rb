require 'spec_helper'

describe Book do

  it { should validate_presence_of :title }
  it { should validate_presence_of :about }

  it { should have_many( :entries ).dependent( :destroy ) }

  it 'has a valid factory' do
    FactoryGirl.build( :book ).should be_valid
  end

end
