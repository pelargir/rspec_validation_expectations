require "spec_helper"

describe TestClass do

  it_should_validate_presence_of :first_name, :last_name
  it_should_validate_numericality_of :age
  it_should_validate_uniqueness_of :email
  it_should_validate_inclusion_of :level, :in => TestClass::Levels
  #it_should_be_createable

end
