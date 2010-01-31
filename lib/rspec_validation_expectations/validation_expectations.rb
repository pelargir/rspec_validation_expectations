module ValidationExpectations

  BasicValidations = [:presence, :acceptance, :numericality, :format, :length, :confirmation, :uniqueness]
  InListValidations = [:exclusion, :inclusion]

  BasicValidations.each do |method|
    define_method("it_should_validate_#{method}_of") do |*one_or_more_fields|
      options = one_or_more_fields.last.is_a?(Hash) ? one_or_more_fields.pop : {}
      model_name = described_type
      one_or_more_fields.each do |field|
        it "should validate #{method} of #{field.to_s.humanize.downcase}" do
          validations = model_name.reflect_on_all_validations
          validations = validations.select { |e| e.macro == "validates_#{method}_of".to_sym }
          validations.collect(&:name).should include(field)
          validations.collect(&:options).should include(options)
        end
      end
    end
  end

  InListValidations.each do |method|
    define_method("it_should_validate_#{method}_of") do |*one_or_more_fields|
      options = one_or_more_fields.last.is_a?(Hash) ? one_or_more_fields.pop : {}
      model_name = described_type
      one_or_more_fields.each do |field|
        it "should validate #{method} of #{field.to_s.humanize.downcase} as one of #{options[:in].to_sentence(:words_connector => 'or', :last_word_connector => true)}" do
          validations = model_name.reflect_on_all_validations
          validation = validations.detect { |v| v.macro == "validates_#{method}_of".to_sym && v.name == field }
          validation.options[:in].sort.should == options[:in].sort unless validation.nil?
        end
      end
    end
  end

end

include ValidationExpectations

def it_should_be_createable *args
  model_name = described_type
  attributes = args.last.is_a?(Hash) ? args.last[:with] : {}

  it "should be creatable" do
    lambda { model_name.create attributes }.should change(model_name, :count).by(1)
  end
end
