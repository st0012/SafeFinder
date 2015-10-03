require "spec_helper"

describe SafeFinder::ModelGenerator, type: :generator do
  destination File.expand_path("../../../../tmp", __FILE__)

  describe "generate" do
    before do
      prepare_destination
      run_generator
    end
    it "generates file in right place with right content" do
      expect(destination_root).to have_structure {
        directory "app" do
          directory "models" do
            directory "safe_finder" do
              file "null_object.rb" do

              end
            end
          end
        end
      }
    end
  end

  describe ".create_model" do
    it "calls template with right directroy" do
      expect(subject).to receive(:template).with("models/null_object.rb", File.join("app/models", "safe_finder", "null_object.rb"))

      subject.create_model
    end
  end
end

