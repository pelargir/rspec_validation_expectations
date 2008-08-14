def it_should_validate_presence_of(*one_or_more_fields)
  model_name = described_type
  one_or_more_fields.each do |field|
    it "should validate presence of #{field.to_s.humanize.downcase}" do
      validations = model_name.reflect_on_all_validations
      validations = validations.select { |e| e.macro == :validates_presence_of }
      field_names = validations.collect(&:name)
      field_names.should include(field)
    end
  end
end

def it_should_validate_numericality_of(*one_or_more_fields)
  model_name = described_type
  one_or_more_fields.each do |field|
    it "should validate numericality of #{field.to_s.humanize.downcase}" do
      validations = model_name.reflect_on_all_validations
      validations = validations.select { |e| e.macro == :validates_numericality_of }
      field_names = validations.collect(&:name)
      field_names.should include(field)
    end
  end
end

def it_should_validate_uniqueness_of(*one_or_more_fields)
  options = one_or_more_fields.last.is_a?(Hash) ? one_or_more_fields.pop : {}
  model_name = described_type
  one_or_more_fields.each do |field|
    it "should validate uniqueness of #{field.to_s.humanize.downcase}" do
      validations = model_name.reflect_on_all_validations
      validations = validations.select { |e| e.macro == :validates_uniqueness_of }
      validations.collect(&:name).should include(field)
      validations.collect(&:options).should include(options)
    end
  end
end