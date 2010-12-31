require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.info/
describe RangeHash do
  describe "retrieval by key:" do
    it "should allow bare fixnum keys" do
      rh = RangeHash.new({ 1 => :foo })
      rh[1].should == :foo
    end
  
    it "should allow ranges as keys" do
      rh = RangeHash.new({ 1..3 => :foo })
      rh[2].should == :foo
    end
  
    it "should return default value if key not found" do
      rh = RangeHash.new({ 1..3 => :foo}, :bar)
      rh[42].should == :bar
    end
  end
  
  describe "initialization:" do
    it "should have default value of nil" do
      rh = RangeHash.new({ 1..3 => :foo})
      rh[42].should == nil
    end
    
    it "should allow nil initial value" do
      rh = RangeHash.new(nil)
      rh.to_s.should == ""
    end
  end

  describe "adding keys and values: " do
    it "should allow adding new fixnum keys dynamically" do
      rh = RangeHash.new(nil)
      rh[42] = :answer
      rh[42].should == :answer
    end
  
    it "should allow adding new range keys dynamically" do
      rh = RangeHash.new(nil)
      rh[1..3] = :foo
      rh[2].should == :foo
    end
    
    it "should replace existing key-value pair when adding" do
      rh = RangeHash.new({ 1 => :foo})
      rh[1] = :bar
      rh[1].should == :bar
    end
  end

  it "should allow retrieval of sorted keys" do
    rh = RangeHash.new({ 10..20 => :foo, 2 => :bar, 0 => :baz })
    rh.sorted_keys.should == [0, 2, 10..20]
  end
end
