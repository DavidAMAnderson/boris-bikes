require 'spec_helper'

describe Van do
  it { is_expected.to respond_to(:load_bike).with(1).argument }
end
