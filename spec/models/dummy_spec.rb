require_relative "../spec_helper"
class Dummy
  include Mongoid::Document

  field :code, :type => String
  field :status, :type => String

  validates_uniqueness_of :code, if: :review_status?

  def review_status?
    Dummy.where(code: code,
                status: { "$in" => [ "in_review", "approved" ] }).any? unless status == 'rejected'
  end
end

describe "UniquenessValidator" do
  let!(:d1) { Dummy.create!(code: 'pop', status: "approved") }

  it "should raise an error for 'approved'" do
    d2 = Dummy.new(code: 'pop', status: "approved")
    expect {
      d2.save!
    }.to raise_error
  end

  it "should raise an error for 'in_review'" do
    d2 = Dummy.new(code: 'pop', status: "in_review")
    expect {
      d2.save!
    }.to raise_error
  end

  it "should not raise an error for 'rejected'" do
    d2 = Dummy.new(code: 'pop', status: "rejected")
    expect {
      d2.save!
    }.not_to raise_error
  end
end
