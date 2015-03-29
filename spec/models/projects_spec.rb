require_relative "../spec_helper"
describe Project do
  let(:project) do
    Project.new name: 'Mega Hit'
  end

  context "#valid" do
    it "is valid at the start" do
      expect(project).to be_valid
    end
  end
end
