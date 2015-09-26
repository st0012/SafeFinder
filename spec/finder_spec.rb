require "spec_helper"

describe SafeFinder::Finder do
  before do
    User.class_eval do
      include SafeFinder
    end
  end

  describe ".safely" do
    let(:user) { User.create(email: "test@example.com", name: "Stan") }
    describe ".find" do
      it "returns result if found" do
        result = User.find(user.id)
        expect(result).to eq(user)
      end
    end
  end
end
