require "spec_helper"

describe SafeFinder::ModelGenerator do
  describe ".create_model" do
    it "calls template with right directory" do
      expect(subject).to receive(:template).with("models/null_object.rb").and_call_original

      subject.create_model
    end
  end
end

