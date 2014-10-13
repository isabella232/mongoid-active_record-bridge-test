require 'rails_helper'

RSpec.describe Boss, :type => :model do
  shared_examples 'with many mooks', :mooks => :many do
    let!(:mooks) do
      Array.new(3).map { create(:mook, :boss => instance) }
    end
  end

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

  ### has_many_records :mooks ###

  describe '#mooks' do
    it { expect(instance).to have_reader :mooks }

    it { expect(instance.mooks).to be == [] }

    context 'with many mooks', :mooks => :many do
      let(:instance) { super().tap &:save! }

      it { expect(instance.mooks).to contain_exactly(*mooks) }
    end
  end
end
