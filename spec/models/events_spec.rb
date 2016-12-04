require 'spec_helper'

describe Event, type: :model do
  it { is_expected.to have_many :reviews }
end
