def it_should_belong_to *one_or_more_associations
  model_name = described_type
  one_or_more_associations.each do |association|
    it "should belong to #{association}" do
      model_name.should belong_to(association)
    end
  end
end

def it_should_have_many *one_or_more_associations
  model_name = described_type
  one_or_more_associations.each do |association|
    it "should have many #{association}" do
      model_name.should have_many(association)
    end
  end
end

def it_should_have_and_belong_to_many *one_or_more_associations
  model_name = described_type
  one_or_more_associations.each do |association|
    it "should have and belong to many #{association}" do
      model_name.should have_and_belong_to_many(association)
    end
  end
end

def it_should_have_one *one_or_more_associations
  model_name = described_type
  one_or_more_associations.each do |association|
    it "should have one #{association}" do
      model_name.should have_one(association)
    end
  end
end