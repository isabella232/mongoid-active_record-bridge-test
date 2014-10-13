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

  ### belongs_to :boss ###

  describe '#boss' do
    it { expect(instance).to have_reader :boss }

    it { expect(instance.boss).to be nil }
  end

  describe '#boss=' do
    let(:boss) { create(:boss) }

    it { expect(instance).to have_writer :boss= }

    it 'changes the boss' do
      expect { instance.boss = boss }.to change(instance, :boss).to(be == boss)
    end

    it 'changes the boss id' do
      expect { instance.boss = boss }.to change(instance, :boss_id).to(boss.id)
    end
  end

  describe '#boss_id' do
    it { expect(instance).to have_reader :boss_id }

    it { expect(instance.boss_id).to be nil }
  end

  describe '#boss_id=' do
    let(:boss) { create(:boss) }

    it { expect(instance).to have_writer :boss_id= }

    it 'changes the boss' do
      expect { instance.boss_id = boss.id }.to change(instance, :boss).to(be == boss)
    end

    it 'changes the boss id' do
      expect { instance.boss_id = boss.id }.to change(instance, :boss_id).to(boss.id)
    end
  end
end
