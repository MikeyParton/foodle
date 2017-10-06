require 'rails_helper'
require 'vcr_helper'

RSpec.describe OpenFood::Client do
  describe '#barcode_search', :vcr do
    let(:client) { OpenFood::Client.new }

    context 'given a valid barcode' do
      code = 9310055536333
      it 'returns a Product' do
        expect(client.barcode_search(code)).to be_a(OpenFood::Product)
      end
    end

    context 'given an invalid barcode' do
      code = 9909
      it 'returns an error' do
        expect(client.barcode_search(code)).to eq({ error: "Product not found" })
      end
    end
  end
end
