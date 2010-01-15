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

def it_should_validate_inclusion_of(field_name, *args)
  model_name = described_type
  options = args.last.is_a?(Hash) ? args.pop : {}
  
  it "should validate inclusion of #{field_name} as one of #{options[:in].to_sentence(:words_connector => 'or', :last_word_connector => true)}" do
    validations = model_name.reflect_on_all_validations
    validation  = validations.detect {|v| v.macro == :validates_inclusion_of && v.name == field_name}
    
    unless validation.nil?
      validation.options[:in].sort.should == options[:in].sort
    end
  end
end

def it_should_be_createable *args
  model_name = described_type
  attributes = args.last.is_a?(Hash) ? args.last[:with] : {}
  
  it "should be creatable" do
    lambda {model_name.create(attributes)}.should change(model_name, :count).by(1)
  end
end
