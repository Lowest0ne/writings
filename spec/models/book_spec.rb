require 'spec_helper'

describe Book do

  it { should validate_presence_of :title }
  it { should validate_presence_of :about }

  it { should have_many( :entries ).dependent( :destroy ) }

end
