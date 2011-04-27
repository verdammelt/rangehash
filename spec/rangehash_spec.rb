require File.dirname(__FILE__) + '/spec_helper.rb'

describe RangeHash do
  let(:rh) { RangeHash.new }
  let(:rh_with_default) { RangeHash.new(:default_value) }
  let(:rh_with_other)

  describe "[]" do
    it "allows bare fixnum keys" do
      rh[1] = :foo
      rh[1].should == :foo
    end
  
    it "allows ranges as keys" do
      rh[1..3] = :foo
      rh[2].should == :foo
    end
    
    it "allows ranges as keys for lookup if equal" do
      rh[1..3] = :foo
      rh[1..3].should == :foo
    end

    it "allows mix of ranges and fixnums" do
      rh[1] = :foo
      rh[2..4] = :bar
      [rh[1], rh[3]].should == [:foo, :bar]
    end
  
    it "returns default value if key not found" do
      rh_with_default[1..3] = :foo
      rh_with_default[42].should == :default_value
    end
  end

  describe "[]=" do
    it "allows adding new fixnum keys dynamically" do
      rh = RangeHash.new(nil)
      rh[42] = :answer
      rh[42].should == :answer
    end
  
    it "allows adding new range keys dynamically" do
      rh[1..3] = :foo
      rh[2].should == :foo
    end
  end
  
  describe ".delete" do
    it "handles ranges as keys" do
      rh[2..4] = :foo
      rh.delete(2..4)
      rh.has_key?(2..4).should be_false
    end

    it "does not handle ranges specially" do
      rh[2..4] = :foo
      rh.delete(3)
      rh.key?(2..4).should be_true
    end
  end

  describe ".fetch" do
    it "handles ranges" do
      rh[2..4] = :foo
      rh.fetch(3).should == :foo
    end

    it "handle ranges as lookup if equal" do
      rh[2..4] = :foo
      rh.fetch(2..4).should == :foo
    end 


    it "handles ranges and fires IndexError property" do
      rh[2..4] = :foo
      expect { rh.fetch(42) }.to raise_error(IndexError)
    end

    it "handles ranges and default value" do
      rh[2..4] = :foo
      rh.fetch(42, :default).should == :default
    end

    it "handles ranges and block" do
      str = "block not called"

      rh[2..4] = :foo
      rh.fetch(42) { |el| str = "key:" + el.to_s }
      str.should == "key:42"
    end
  end

  describe ".has_key?" do
    it "handles ranges" do
      rh[2..4] = :foo
      rh.has_key?(3).should be_true
      rh.has_key?(2..4).should be_true
    end
  end

  describe ".include?" do
    it "handles ranges" do
      rh[2..4] = :foo
      rh.include?(3).should be_true
      rh.has_key?(2..4).should be_true
    end
  end

  describe ".key?" do
    it "handles ranges" do
      rh[2..4] = :foo
      rh.key?(3).should be_true
      rh.has_key?(2..4).should be_true
    end
  end

  describe ".member?" do
    it "handles ranges" do
      rh[2..4] = :foo
      rh.key?(3).should be_true
      rh.has_key?(2..4).should be_true
    end
  end

  describe ".index" do
    it "handles ranges" do
      rh[2..4] = :foo
      rh.index(:foo).should == (2..4)
    end
  end

  describe ".sorted_keys" do
    it "allows retrieval of sorted keys" do
      rh[10..20] = :foo
      rh[2] = :bar
      rh[0] = :baz
      rh.sorted_keys.should == [0, 2, 10..20]
    end
  end
end
