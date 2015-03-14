module CorreiosSigep
  module Builders
    module XML
      describe RequestSRO do
        describe '.build_xml' do
          subject { described_class.build_xml(sro) }

          let(:sro_params)   { { collect_number: '1234', type: 'A' } }
          let(:sro)          { CorreiosSigep::Models::SRO.new(sro_params) }
          let(:expected_xml) { builders_fixture('request_sro.xml') }

          it {  should eq expected_xml }
        end
      end
    end
  end
end
