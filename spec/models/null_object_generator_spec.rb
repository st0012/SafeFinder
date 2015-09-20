require "spec_helper"

describe SafeFinder::NullObjectGenerator do
  let(:sample_class) { Post }
  subject { SafeFinder::NullObjectGenerator.new(sample_class) }

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
  end
end
