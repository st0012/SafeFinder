require "spec_helper"

describe SafeFinder::NullObjectGenerator do
  describe ".new" do
    let(:sample_class) { Post.new }
    it "sets right attributes" do
    end
  end
end
