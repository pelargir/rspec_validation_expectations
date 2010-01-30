require "spec_helper"

describe TestClass do

  it_should_belong_to :user_group
  it_should_have_one :address
  it_should_have_many :projects
  it_should_have_and_belong_to_many :groups

end
