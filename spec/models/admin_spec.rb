require 'spec_helper'

describe Admin do

  it { should validate_presence_of :email }

  it 'has a valid factory' do
    FactoryGirl.build( :admin ).should be_valid
  end

end
