require "spec_helper"

describe SafeFinder::FinderMethods do
  before do
    User.class_eval do
      include SafeFinder
    end
  end

  describe ".safely" do
    let(:user) { User.create(email: "test@example.com", name: "Stan") }
    describe ".find" do
      it "returns result if found" do
        result = User.safely.find(user.id)
        expect(result).to eq(user)
      end

      it "returns null_object if can't find" do
        result = User.safely.find(user.id + 1)
        expect(result.class).to eq(NullUser)
      end
    end
  end
end
