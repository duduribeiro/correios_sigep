require 'spec_helper'

module CorreiosSigep
  module Builders
    module XML
      describe RequestCollectNumber do
        describe '.build_xml' do
          subject { described_class.build_xml(logistic_reverse) }

          let(:logistic_reverse) { CorreiosSigep::Models::LogisticReverse.new }
          let(:expected_xml)     { builders_fixture('request_collect_number.xml') }

          before :each do
            seed_logistic_reverse(logistic_reverse)
          end

          it {  should eq expected_xml }
        end
      end
    end
  end
end
