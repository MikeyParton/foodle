require 'rails_helper'

RSpec.describe Builder::Product do
  describe '#save' do
    describe 'creating a product' do
      context 'given valid params for a solid product' do
        valid_params = {
          name: 'solid product',
          barcode: '999999999999',
          serving: '30 g' # this tells us it is solid
        }

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'returns a product' do
          expect(product).to be_a(Product)
        end

        it 'sets the product name' do
          expect(product.name).to eq('solid product')
        end

        it 'sets the product barcode' do
          expect(product.barcode).to eq('999999999999')
        end

        it 'sets the product serving' do
          expect(product.serving_value).to eq(30000)
          expect(product.serving_unit).to eq('mg')
        end

        it 'sets the liquid flag to false' do
          expect(product.liquid).to eq(false)
        end
      end

      context 'given valid params for a liquid product' do
        valid_params = {
          name: 'liquid product',
          barcode: '999999999999',
          serving: '30 ml' # this tells us it is liquid
        }

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'returns a product' do
          expect(product).to be_a(Product)
        end

        it 'sets the product name' do
          expect(product.name).to eq('liquid product')
        end

        it 'sets the product barcode' do
          expect(product.barcode).to eq('999999999999')
        end

        it 'sets the product serving' do
          expect(product.serving_value).to eq(30000)
          expect(product.serving_unit).to eq('ul')
        end

        it 'sets the liquid flag to true' do
          expect(product.liquid).to eq(true)
        end
      end
    end

    describe 'creating brand associaions' do
      context 'given a new brand name' do
        valid_params = {
          name: 'product',
          barcode: '999999999999',
          brands: ['some brand']
        }

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'links the brand to the new product' do
          expect(product.brands.length).to eq(1)
        end

        it 'sets the name of the new brand' do
          expect(product.brands.first.name).to eq('some brand')
        end
      end

      context 'given an existing brand name' do
        let(:brand) { create(:brand) }

        let(:valid_params) {{
          name: 'product',
          barcode: '999999999999',
          brands: [brand.name]
        }}

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'links the existing brand to the new product' do
          expect(product.brands).to include(brand)
        end
      end
    end

    describe 'creating ingredient associaions' do
      context 'given a new ingredient name' do
        valid_params = {
          name: 'product',
          barcode: '999999999999',
          ingredients: ['some ingredient']
        }

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'links the ingredient to the new product' do
          expect(product.ingredients.length).to eq(1)
        end

        it 'sets the name of the new ingredient' do
          expect(product.ingredients.first.name).to eq('some ingredient')
        end
      end

      context 'given an existing ingredient name' do
        let(:ingredient) { create(:ingredient) }

        let(:valid_params) {{
          name: 'product',
          barcode: '999999999999',
          ingredients: [ingredient.name]
        }}

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'links the existing ingredient to the new product' do
          expect(product.ingredients).to include(ingredient)
        end
      end
    end

    describe 'creating nutrients and handling units' do
      context 'given valid nutrient params' do
        let(:ingredient) { create(:ingredient) }

        let(:valid_params) {{
          name: 'product',
          barcode: '999999999999',
          energy: '20 kJ',
          proteins: '14 g',
          carbohydrates: '15 g',
          fat: '5 g',
          sugars: '3 g',
          fiber: '3 g',
          sodium: '200 mg'
        }}

        let(:builder) { Builder::Product.new(valid_params) }
        let(:product) { builder.save }

        it 'saves energy as J' do
          expect(product.nutrients.energy_base_value).to eq(20000)
          expect(product.nutrients.energy_base_unit).to eq('J')
        end

        it 'saves proteins as mg' do
          expect(product.nutrients.proteins_base_value).to eq(14000)
          expect(product.nutrients.proteins_base_unit).to eq('mg')
        end

        it 'saves carbohydrates as mg' do
          expect(product.nutrients.carbohydrates_base_value).to eq(15000)
          expect(product.nutrients.carbohydrates_base_unit).to eq('mg')
        end

        it 'saves fat as mg' do
          expect(product.nutrients.fat_base_value).to eq(5000)
          expect(product.nutrients.fat_base_unit).to eq('mg')
        end

        it 'saves sugars as mg' do
          expect(product.nutrients.sugars_base_value).to eq(3000)
          expect(product.nutrients.sugars_base_unit).to eq('mg')
        end

        it 'saves fiber as mg' do
          expect(product.nutrients.fiber_base_value).to eq(3000)
          expect(product.nutrients.fiber_base_unit).to eq('mg')
        end

        it 'saves sodium as mg' do
          expect(product.nutrients.sodium_base_value).to eq(200)
          expect(product.nutrients.sodium_base_unit).to eq('mg')
        end
      end
    end
  end
end
