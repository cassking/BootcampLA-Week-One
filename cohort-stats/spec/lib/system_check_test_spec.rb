require "spec_helper"

describe SystemCheck do
  describe ".new" do
    it "takes a name and body as arguments" do
         due = Date.parse("2020/08/14")
      system_check = SystemCheck.new("System check name", due)
      expect(system_check).to be_a(SystemCheck)
    end
  end

  let(:system_check) do
    due = Date.parse("2020/08/21")
    SystemCheck.new("Grocery List with AJAX", due)
  end
  describe "#submittable?" do
    it "returns 'true' if submittable is true" do
      expect(system_check.submittable?).to eq(true)
    end

  end
end
