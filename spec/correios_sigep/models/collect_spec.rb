require 'spec_helper'

module CorreiosSigep
  module Models
    describe Collect do
      it { should respond_to :aditional_service }
      it { should respond_to :ag }
      it { should respond_to :ar }
      it { should respond_to :card }
      it { should respond_to :checklist }
      it { should respond_to :client_id }
      it { should respond_to :declared_value }
      it { should respond_to :description }
      it { should respond_to :number }
      it { should respond_to :type }
      it { should respond_to :product }
      it { should respond_to :product_params }
      it { should respond_to :sender }
      it { should respond_to :sender_params }
      it { should respond_to :objects }

      describe '#initialize' do
        let(:collect) { described_class.new params }

        context 'with aditional service param' do
          let(:params) { { aditional_service: '100.5' } }
          it 'set aditional service value' do
            expect(collect.aditional_service).to eq '100.5'
          end
        end

        context 'with ag param' do
          let(:params) { { ag: '1' } }
          it 'set ag value' do
            expect(collect.ag).to eq '1'
          end
        end

        context 'with ar param' do
          let(:params) { { ar: '2' } }
          it 'set ar value' do
            expect(collect.ar).to eq '2'
          end
        end

        context 'with card param' do
          let(:params) { { card: '12345' } }
          it 'set card value' do
            expect(collect.card).to eq '12345'
          end
        end

        context 'with checklist param' do
          let(:params) { { checklist: 'CK' } }
          it 'set checklist value' do
            expect(collect.checklist).to eq 'CK'
          end
        end

        context 'with client_id param' do
          let(:params) { { client_id: '10965' } }
          it 'set client_id value' do
            expect(collect.client_id).to eq '10965'
          end
        end

        context 'with declared value param' do
          let(:params) { { declared_value: '200.5' } }
          it 'set declared_value value' do
            expect(collect.declared_value).to eq '200.5'
          end
        end

        context 'with description param' do
          let(:params) { { description: 'description' } }
          it 'set declared_value value' do
            expect(collect.description).to eq 'description'
          end
        end

        context 'with number param' do
          let(:params) { { number: 3 } }
          it 'set number value' do
            expect(collect.number).to eq 3
          end
        end

        context 'with type param' do
          let(:params) { { type: 'type' } }
          it 'set type value' do
            expect(collect.type).to eq 'type'
          end
        end


        context 'with product param' do
          let(:product) { double('product') }
          let(:params) { { product: product } }
          it 'set product as the object passed in param' do
            expect(collect.product).to eq product
          end
        end

        context 'with product_params param' do
          let(:params) { { product_params: { code: 'code' } } }
          it 'set product as new object created with passed product_params' do
            expect(collect.product).to be_a CorreiosSigep::Models::Product
            expect(collect.product.code).to eq 'code'
          end
        end

        context 'with sender param' do
          let(:sender) { double('sender') }
          let(:params) { { sender: sender } }
          it 'set sender as the object passed in param' do
            expect(collect.sender).to eq sender
          end
        end

        context 'with sender_params param' do
          let(:params) { { sender_params: { name: 'sender name' } } }
          it 'set sender as new object created with passed sender_params' do
            expect(collect.sender).to be_a CorreiosSigep::Models::Sender
            expect(collect.sender.name).to eq 'sender name'
          end
        end

        context 'objects param' do
          context  'present' do
            let(:objects) { [ double('object1'), double('object2') ]  }
            let(:params) { { objects: objects } }
            it 'return the objects passed in parameter' do
              expect(collect.objects.size).to eq 2
            end
          end

          context 'not present' do
            let(:params) { {} }
            it 'returns an empty array' do
              expect(collect.objects).to be_a(Array)
              expect(collect.objects).to be_empty
            end
          end
        end

      end
    end
  end
end
