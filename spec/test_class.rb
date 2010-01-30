class TestClass < ActiveRecord::Base

  Levels = %w(beginner intermediate expert)

  validates_presence_of :first_name, :last_name
  validates_numericality_of :age
  validates_uniqueness_of :email
  validates_inclusion_of :level, :in => Levels

end
