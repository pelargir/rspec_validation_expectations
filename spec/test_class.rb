class TestClass < ActiveRecord::Base

  Levels = %w(beginner intermediate expert)
  BadUsernames = %w(user admin)

  belongs_to :user_group
  has_one :address
  has_many :projects
  has_and_belongs_to_many :groups

  attr_protected :admin

  validates_presence_of :first_name, :last_name
  validates_numericality_of :age
  validates_uniqueness_of :email
  validates_inclusion_of :level, :in => Levels
  validates_exclusion_of :username, :in => BadUsernames
  validates_format_of :legacy_code, :with => /\A[a-zA-Z]+\z/
  validates_length_of :password, :in => 6..20
  validates_confirmation_of :email
  validates_acceptance_of :terms_of_service

end
