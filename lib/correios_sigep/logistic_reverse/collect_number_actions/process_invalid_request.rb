module CorreiosSigep
  module LogisticReverse
    module CollectNumberActions
      class ProcessInvalidRequest
        def initialize(response)
          @response = response
        end

        def run
          code          = @response.search('//cod_erro').text.to_i
          error_message = @response.search('//msg_erro').text
          klass         = (errors[code] || Models::Errors::UnknownError)

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
            Models::CorreiosResponseCodes::NOT_CONFIGURED_CLIENT => Models::Errors::NotConfiguredClient
          }
        end
      end
    end
  end
end
