require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(email: 'usuario@ruptiva.com.br') }

  subject { @user }

  it "usuário deve conter email e senha" do
    @userB = User.new()
    @userC = User.new(email: 'joaobosco@ruptiva.com')
    @userD = User.new(password: 'joão')
    @user.password = 'ilikeruptiva'

    expect(@userB).not_to be_valid
    expect(@userC).not_to be_valid
    expect(@userD).not_to be_valid
    expect(@user).to be_valid
  end
end
