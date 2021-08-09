require 'rails_helper'

RSpec.describe "User", type: :model do
  it "creates and saves to activerecord a new user" do
    expect { @user = User.create!(email: 'test@test.com', password: 'test123') }.to change { User.count }.by(1)
  end

  it "does not accept new user if password is too short" do
    expect { @user = User.create!(email: 'test@test.com', password: 't') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "does not accept new user if email is too short" do
    expect { @user = User.create!(email: '', password: 't') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "does not accept new user if email and password are blank" do
    expect { @user = User.create!(email: '', password: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
