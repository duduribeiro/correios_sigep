require 'spec_helper'
require 'pry'

module CorreiosSigep
  module Builders
    module XML
      describe Request do
        describe '.build_xml' do
          let(:request) { double(:request, to_xml: '<root><test></root>') }
          context 'when do not override anything' do
            it 'builds a Authentication XML with Configuration parameters' do
              expected_response = [
                '<cartao>0057018901</cartao>',
                '<codigo_servico>41076</codigo_servico>',
                '<contrato>9912208555</contrato>',
                '<codAdministrativo>08082650</codAdministrativo>',
                '<senha>8o8otn</senha>',
                '<usuario>60618043</usuario><test/>'
              ].join + "\n"
              expect(described_class.build_xml request).to eq expected_response
            end
          end

          context 'when override the administrative fields' do
            it 'builds a Authentication XML with the override parameter' do
              administrative_fields = Models::AdministrativeFields.new(administrative_code: 'adm123',
                                                                       card: 'card123',
                                                                       contract: 'cont123',
                                                                       service_code: 'ser123')
              expected_response = [
                '<cartao>card123</cartao>',
                '<codigo_servico>ser123</codigo_servico>',
                '<contrato>cont123</contrato>',
                '<codAdministrativo>adm123</codAdministrativo>',
                '<senha>8o8otn</senha>',
                '<usuario>60618043</usuario><test/>'
              ].join + "\n"
              expect(described_class.build_xml request, administrative: administrative_fields).to eq expected_response
            end
          end

        end
      end
    end
  end
end
