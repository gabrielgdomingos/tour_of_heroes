require 'rails_helper'

RSpec.describe Hero, type: :model do
  subject { Hero.new(name: 'Thor') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'scopes' do
    it '.search' do
      name = 'Thor'
      expect(Hero.where('LOWER(name) LIKE ?', "%#{name.downcase}%")).to eq Hero.search(name)
    end

    it '.sorted_by_name' do
      expect(Hero.order(:name)).to eq Hero.sorted_by_name
    end
  end
end