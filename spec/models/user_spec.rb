require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(email: 'usuario@ruptiva.com.br') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'usuario@ruptiva.com.br'
  end
end
