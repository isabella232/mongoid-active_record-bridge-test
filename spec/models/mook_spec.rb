require 'rails_helper'

RSpec.describe Mook, :type => :model do
  let(:attributes) { {} }
  let(:instance)   { build(:mook) }

  describe '::create' do
    it 'creates a new model instance' do
      expect {
        described_class.create! attributes_for(:mook)
      }.to change(described_class, :count).by(1)
    end
  end

  describe '#hit_points' do
    it { expect(instance).to have_property :hit_points }
  end

  describe '#weapon' do
    it { expect(instance).to have_property :weapon }
  end
end
