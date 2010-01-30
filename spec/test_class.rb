class TestClass < ActiveRecord::Base

  Levels = %w(beginner intermediate expert)

  belongs_to :user_group
  has_one :address
  has_many :projects
  has_and_belongs_to_many :groups

  validates_presence_of :first_name, :last_name
  validates_numericality_of :age
  validates_uniqueness_of :email
  validates_inclusion_of :level, :in => Levels

end
