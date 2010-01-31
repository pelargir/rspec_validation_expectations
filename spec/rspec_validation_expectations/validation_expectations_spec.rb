require "spec_helper"

describe TestClass do

  it_should_validate_presence_of :first_name, :last_name
  it_should_validate_numericality_of :age
  it_should_validate_uniqueness_of :email
  it_should_validate_inclusion_of :level, :in => TestClass::Levels
  it_should_validate_exclusion_of :username, :in => TestClass::BadUsernames
  it_should_validate_format_of :legacy_code, :with => /\A[a-zA-Z]+\z/
  it_should_validate_length_of :password, :in => 6..20
  it_should_validate_confirmation_of :email
  it_should_validate_acceptance_of :terms_of_service
  #it_should_be_createable

end
