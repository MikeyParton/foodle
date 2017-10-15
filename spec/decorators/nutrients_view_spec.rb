require 'rails_helper'

RSpec.describe NutrientsView do
  context 'given a valid serving' do
    let(:nutrients) { create(:nutrients) }
    let!(:view) { NutrientsView.new(nutrients, '10g') }

    it 'returns an energy value for that serving' do
      expect(view.energy_value).to eq(nutrients.energy_base_value / 10)
    end
  end
end
