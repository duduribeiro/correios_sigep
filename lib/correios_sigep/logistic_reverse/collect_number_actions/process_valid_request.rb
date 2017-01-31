module CorreiosSigep
  module LogisticReverse
    module CollectNumberActions
      class ProcessValidRequest
        def initialize(response)
          @response = response
        end

        def run
          result_node = @response.search('//resultado_solicitacao')
          code = result_node.search('//codigo_erro').text.to_i

          if Models::CorreiosResponseCodes::SUCCESS != code
            error_message = @response.search('//descricao_erro').text
            raise Models::Errors::InvalidSolicitation.new(error_message)
          end

          result = result_node.search('//numero_coleta')
          result.first.text
        end
      end
    end
  end
end
