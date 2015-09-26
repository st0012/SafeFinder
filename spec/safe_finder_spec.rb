require 'spec_helper'

describe SafeFinder do
  let(:subject_class) do
    class TestClass; end
    TestClass
  end

  it 'has a version number' do
    expect(SafeFinder::VERSION).not_to be nil
  end

  before do
    subject_class.class_eval do
      include SafeFinder

      safe_attribute(:test_attribute, "test value")
      safe_method :test_method do
        "This is test method"
      end
    end
  end

  describe ".safe_attribute" do
    it "sets null_object_attributes" do
      expect(subject_class.null_object_attributes[:test_attribute]).to eq("test value")
    end
  end

  describe ".safe_method" do
    it "sets null_object_attributes" do
      expect(subject_class.null_object_methods[:test_method].call).to eq("This is test method")
    end
  end

  describe ".null_object" do
    it "returns null_object" do
      null_object = Post.null_object
      expect(null_object.class).to eq(NullPost)
    end
  end
end

