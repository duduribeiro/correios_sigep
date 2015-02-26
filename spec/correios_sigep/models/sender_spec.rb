require 'spec_helper'

module CorreiosSigep
  module Models
    describe Sender do
      it { should respond_to :address }
      it { should respond_to :area_code }
      it { should respond_to :city }
      it { should respond_to :complement }
      it { should respond_to :email }
      it { should respond_to :identification }
      it { should respond_to :mobile_area_code }
      it { should respond_to :mobile_phone }
      it { should respond_to :name }
      it { should respond_to :neighborhood }
      it { should respond_to :number }
      it { should respond_to :phone }
      it { should respond_to :postal_code }
      it { should respond_to :reference }
      it { should respond_to :sms }
      it { should respond_to :state }

      describe '#initialize' do
        let(:sender) { described_class.new params }
        context 'with address param' do
          let(:params) { { address: 'address' } }
          it 'set address value' do
            expect(sender.address).to eq 'address'
          end
        end

        context 'with area code param' do
          let(:params) { { area_code: 16 } }
          it 'set area code value' do
            expect(sender.area_code).to eq 16
          end
        end

        context 'with city param' do
          let(:params) { { city: 'ARARAQUARA' } }
          it 'set city value' do
            expect(sender.city).to eq 'ARARAQUARA'
          end
        end

        context 'with complement param' do
          let(:params) { { complement: 'APTO 101' } }
          it 'set complement value' do
            expect(sender.complement).to eq 'APTO 101'
          end
        end

        context 'with email param' do
          let(:params) { { email: 'test@example.com' } }
          it 'set email value' do
            expect(sender.email).to eq 'test@example.com'
          end
        end

        context 'with identification param' do
          let(:params) { { identification: 'IDENTIFICATION' } }
          it 'set identification value' do
            expect(sender.identification).to eq 'IDENTIFICATION'
          end
        end

        context 'with mobile area code param' do
          let(:params) { { mobile_area_code: 16 } }
          it 'set mobile area code value' do
            expect(sender.mobile_area_code).to eq 16
          end
        end


        context 'with mobile phone code param' do
          let(:params) { { mobile_phone: '16123456789' } }
          it 'set mobile area code value' do
            expect(sender.mobile_phone).to eq '16123456789'
          end
        end

        context 'with name param' do
          let(:params) { { name: 'TEST' } }
          it 'set name value' do
            expect(sender.name).to eq 'TEST'
          end
        end

        context 'with neighborhood param' do
          let(:params) { { neighborhood: 'NEIGHBORHOOD' } }
          it 'set neighborhood value' do
            expect(sender.neighborhood).to eq 'NEIGHBORHOOD'
          end
        end

        context 'with number param' do
          let(:params) { { number: 125 } }
          it 'set number value' do
            expect(sender.number).to eq 125
          end
        end

        context 'with phone param' do
          let(:params) { { phone: '16123456789'} }
          it 'set phone value' do
            expect(sender.phone).to eq '16123456789'
          end
        end

        context 'with postal code param' do
          let(:params) { { postal_code: '14840000'} }
          it 'set postal_code value' do
            expect(sender.postal_code).to eq '14840000'
          end
        end

        context 'with reference param' do
          let(:params) { { reference: 'REFERENCE'} }
          it 'set reference value' do
            expect(sender.reference).to eq 'REFERENCE'
          end
        end

        context 'with sms param' do
          let(:params) { { sms: 'S'} }
          it 'set sms value' do
            expect(sender.sms).to eq 'S'
          end
        end

        context 'with state param' do
          let(:params) { { state: 'SP'} }
          it 'set state value' do
            expect(sender.state).to eq 'SP'
          end
        end

      end
    end
  end
end
