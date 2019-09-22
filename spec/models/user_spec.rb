require 'rails_helper'

RSpec.describe User, type: :model do
  it "does not have password less than 7 characters." do
    user = User.new(name: "Example",
                    email: "example@gmail.com",
                    password: "abcdefg",
                    password_confirmation: "abcdefg")
    expect(user).not_to be_valid
  end
end
