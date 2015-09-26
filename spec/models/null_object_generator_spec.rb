require "spec_helper"

describe SafeFinder::NullObjectGenerator do
  let(:sample_class) { Post }
  subject { SafeFinder::NullObjectGenerator.new(sample_class) }

  before do
    Post.class_eval do
      extend SafeFinder

      safe_attribute :title, "It's null"
      safe_attribute :is_published, false
      safe_attribute :view_count, 0
      safe_method :hello do
        "Hello"
      end
    end
  end

  describe ".new" do
    it "sets right attributes" do
      expect(subject.original_class).to eq(Post)
    end
  end

  describe "#generate" do
    it "generates null object with right class" do
      null_object = subject.generate

      expect(null_object.class.to_s).to eq("NullPost")
    end

    it "generates null object with right values" do
      null_object = subject.generate

      expect(null_object.title).to eq("It's null")
      expect(null_object.user_id).to be_nil
      expect(null_object.is_published).to be_falsey
      expect(null_object.view_count).to eq(0)
      expect(null_object.content).to be_nil
    end

    it "generates null object with right methods" do
      null_object = subject.generate

      expect(null_object.hello).to eq("Hello")
    end
  end
end
