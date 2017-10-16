require 'rails_helper'

RSpec.describe NutrientsView do
  context 'with values and units' do
    context 'given a valid serving' do
      let(:nutrients) { create(:nutrients, energy_base_value: 20000, energy_base_unit: 'J') }
      let!(:view) { NutrientsView.new(nutrients, '10g') }

      it 'returns the correct energy value for that serving' do
        expect(view.energy_value).to eq(2)
      end

      it 'returns energy in nice units' do
        expect(view.energy_unit).to eq('kJ')
      end
    end
  end

  context 'with values and units missing' do
    let(:nutrients) { create(:nutrients, energy_base_value: nil, energy_base_unit: nil) }
    let!(:view) { NutrientsView.new(nutrients, '10g') }

    it 'returns nil as the energy value' do
      expect(view.energy_value).to eq(nil)
    end

    it 'returns nil as units' do
      expect(view.energy_unit).to eq(nil)
    end
  end
end
