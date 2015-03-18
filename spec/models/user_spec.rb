require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_length_of(:password).is_at_least(6).is_at_most(20) }
  it { should validate_uniqueness_of :email }
end
