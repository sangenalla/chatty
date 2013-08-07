require "spec_helper"

describe User do
  it "gets the params properly" do
    vinoth = User.create!(name: "Vinoth", email: "visitvinoth@gmail.com")
    expect(vinoth.name).to eq('Vinoth')
  end

  it "should require a username" do
    User.new(name: "", email: "sam@ram.com"  ).should_not be_valid
    User.new(name: "badava", email: "sam@ram.com"  ).should be_valid
  end

  it "should require a email" do
    User.new(name: "komaan", :email => "").should_not be_valid
    User.new(name: "komaan", :email => "somali@komali.pk").should be_valid
  end

  it "should require a valid" do
    User.new(name: "komaan", email: "somali@komali").should_not be_valid
    User.new(name: "komaan", email: "somali@komali.co.in").should be_valid
    User.new(name: "komaan", email: "somali@komali.pk").should be_valid
  end
end
