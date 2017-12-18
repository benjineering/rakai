require 'spec_helper'

describe Rakai do
  it 'has a version number' do
    expect(Rakai::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(Rakai.drop_a_fat_beat).not_to be nil
  end
end
