require 'spec_helper'

module CorreiosSigep
  module Models
    describe Product do
      it { should respond_to :code }
      it { should respond_to :type }
      it { should respond_to :quantity }

      describe '#initialize' do
        let(:product) { described_class.new params }

        context 'with code param' do
          let(:params) { { code: 'code' } }
          it 'set code value' do
            expect(product.code).to eq 'code'
          end
        end

        context 'with type param' do
          let(:params) { { type: 'type' } }
          it 'set type value' do
            expect(product.type).to eq 'type'
          end
        end

        context 'with quantity param' do
          let(:params) { { quantity: 2 } }
          it 'set quantity value' do
            expect(product.quantity).to eq 2
          end
        end

      end
    end
  end
end
