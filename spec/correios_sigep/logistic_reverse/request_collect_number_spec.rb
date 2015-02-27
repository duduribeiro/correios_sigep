require 'spec_helper'

module CorreiosSigep
  module LogisticReverse
    describe RequestCollectNumber do
      let(:logistic_reverse) { Models::LogisticReverse.new }
      let(:request_collect) { described_class.new logistic_reverse }

      before do
        seed_logistic_reverse(logistic_reverse)
      end

      describe '.process' do
        subject { request_collect.process }
        context 'with valid data' do
          it 'should return the collect number' do
            subject
          end
        end
      end
    end
  end
end
