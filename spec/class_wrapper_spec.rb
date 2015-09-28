require "spec_helper"

describe SafeFinder::ClassWrapper do
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

      it "raises exception if not using safely scope" do
        expect{ User.find(user.id + 1) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe ".find_by_COLUMN" do
      it "returns result if found" do
        expect(User.safely.find_by_email(user.email)).to eq(user)
      end

      it "returns null_object if not found" do
        null_object = User.safely.find_by_email(user.email << "123")
        expect(null_object.class).to eq(NullUser)
      end

      it "returns nil if not found and without safely scope" do
        expect(User.find_by_email(user.email < "123")).to be_nil
      end
    end
  end
end
