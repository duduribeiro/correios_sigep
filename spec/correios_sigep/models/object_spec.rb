require 'spec_helper'

module CorreiosSigep
  module Models
    describe Object do
      it { should respond_to :description }
      it { should respond_to :id }
      it { should respond_to :item }
      it { should respond_to :num }
      it { should respond_to :ship }

      describe '#initialize' do
        let(:object) { described_class.new params }

        context 'with description param' do
          let(:params) { { description: 'description' } }
          it 'set description value' do
            expect(object.description).to eq 'description'
          end
        end

        context 'with id param' do
          let(:params) { { id: 1234 } }
          it 'set id value' do
            expect(object.id).to eq 1234
          end
        end

        context 'with item param' do
          let(:params) { { item: 'Item' } }
          it 'set item value' do
            expect(object.item).to eq 'Item'
          end
        end

        context 'with num param' do
          let(:params) { { num: 2 } }
          it 'set num value' do
            expect(object.num).to eq 2
          end
        end

        context 'with ship param' do
          let(:params) { { ship: 'Ship' } }
          it 'set ship value' do
            expect(object.ship).to eq 'Ship'
          end
        end

      end
    end
  end
end
