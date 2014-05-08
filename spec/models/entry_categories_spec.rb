require 'spec_helper'

describe EntryCategory do

  it { should belong_to :entry }
  it { should belong_to :category }

  it { should validate_presence_of :entry }
  it { should validate_presence_of :category }

end
