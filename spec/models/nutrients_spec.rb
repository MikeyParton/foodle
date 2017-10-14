require 'rails_helper'

RSpec.describe Nutrients do
  let(:nutrients) { build(:nutrients) }

  describe '#in' do

    fcontext 'given a valid unit string' do
      let(:new_nutrients) { nutrients.in('10g') }
      it { expect(new_nutrients.energy_base_value).to eq(nutrients.energy_base_value / 10) }
    end
  end
end
