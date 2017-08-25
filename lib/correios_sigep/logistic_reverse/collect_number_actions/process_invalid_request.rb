module CorreiosSigep
  module LogisticReverse
    module CollectNumberActions
      class ProcessInvalidRequest
        def initialize(response)
          @response = response
        end

        def run
          klass = (errors[error_code] || errors[new_error_code] || Models::Errors::UnknownError)
          raise klass.new(error_message)
        end

        private

        def errors
          {
            Models::CorreiosResponseCodes::TICKET_ALREADY_USED => Models::Errors::TicketAlreadyUsed,
            Models::CorreiosResponseCodes::UNAVAILABLE_SERVICE => Models::Errors::UnavailableService,
            Models::CorreiosResponseCodes::INEXISTENT_ZIPCODE => Models::Errors::InexistentZipcode,
            Models::CorreiosResponseCodes::UNAVAILABLE_HOUSE_COLLECT => Models::Errors::UnavailableHouseCollect,
            Models::CorreiosResponseCodes::COLLECT_NOT_ANSWERED_FOR_THE_ZIPCODE => Models::Errors::CollectNotAnsweredForTheZipcode,
            Models::CorreiosResponseCodes::NOT_CONFIGURED_CLIENT => Models::Errors::NotConfiguredClient,
            Models::CorreiosResponseCodes::INVALID_CONTRACT => Models::Errors::InvalidContract,
            Models::CorreiosResponseCodes::INVALID_DECLARED_VALUE => Models::Errors::InvalidDeclaredValue
          }
        end

        def error_code
          return nil if @response.search('//cod_erro').empty?
          @response.search('//cod_erro').text.to_i
        end

        def new_error_code
          return nil if @response.search('//codigo_erro').empty?
          @response.search('//codigo_erro').text.to_i
        end

        def error_message
          "#{@response.search('//msg_erro').text} #{@response.search('//descricao_erro').text}".strip
        end
      end
    end
  end
end
