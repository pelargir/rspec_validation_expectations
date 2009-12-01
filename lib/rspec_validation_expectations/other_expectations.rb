def it_should_protect(*one_or_more_attrs)
  model_class = described_type
  one_or_more_attrs.each do |attr|
    it "should protect attribute #{attr}" do
      model_class.protected_attributes.should include(attr.to_s)
    end
  end
end
