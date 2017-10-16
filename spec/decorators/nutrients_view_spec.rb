require 'rails_helper'

RSpec.describe NutrientsView do
  context 'given a valid serving' do
    let(:nutrients) { create(:nutrients, energy_base_value: 20000, energy_base_unit: 'J') }
    let!(:view) { NutrientsView.new(nutrients, '10g') }

    it 'returns an energy value for that serving' do
      expect(view.energy_value).to eq(2)
      expect(view.energy_unit).to eq('kJ')
    end
  end
end
