require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let (:userA) { build(:user, role: :user) }
  let (:userB) { build(:user, role: :user) }
  let (:user_admin) { build(:user) }

  subject { described_class }

  permissions :index? do
    it "proíbe acesso caso não seja admin" do
      expect(subject).not_to permit(userA)
    end
    it "permite acesso caso seja admin" do
      expect(subject).to permit(user_admin)
    end
  end

  permissions :show? do
    it "não permite que outro usuário comum veja seus dados" do
      expect(subject).not_to permit(userA, userB)
    end
    it "permite você ver seus dados" do
      expect(subject).to permit(userA, userA)
    end
    it "permite um admin ver dados de qualquer perfil" do
      expect(subject).to permit(user_admin)
    end
  end

  permissions :update? do
    it "permite você atualizar seus dados" do
      expect(subject).to permit(userA, userA)
    end
    it "permite um admin atualizar seus dados" do
      expect(subject).to permit(user_admin)
    end
    it "não permite outro usuário comum atualizar seus dados" do
      expect(subject).not_to permit(userA, userB)
    end
  end

  permissions :destroy? do
    it "permite você excluir seu perfil" do
      expect(subject).to permit(userA, userA)
    end
    it "permite um admin excluir qualquer perfil" do
      expect(subject).to permit(user_admin)
    end
    it "não permite outro usuário comum excluir seu perfil" do
      expect(subject).not_to permit(userA, userB)
    end
  end
end
