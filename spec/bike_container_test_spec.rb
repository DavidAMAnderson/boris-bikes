require 'spec_helper'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end
