require 'rails_helper'

RSpec.describe Boss, :type => :model do
  let(:attributes) { {} }
  let(:instance)   { build(:boss, attributes) }

  describe '::create' do
    it 'creates a new model instance' do
      expect {
        described_class.create! attributes_for(:boss)
      }.to change(described_class, :count).by(1)
    end
  end

  describe '#hit_points' do
    it { expect(instance).to have_property(:hit_points) }
  end

  describe '#name' do
    it { expect(instance).to have_property(:name) }
  end

  describe '#nickname' do
    it { expect(instance).to have_property(:nickname) }
  end

  describe '#special_attacks' do
    it { expect(instance).to have_property(:special_attacks) }
  end
end
