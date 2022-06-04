module JurnalApi
  class Client
    # Defines methods related to ReceivePayment
    module PaymentMethods
      def payment_methods(params = {})
        response = get('payment_methods', params)
        response
      end

      def payment_method_find(id)
        response = get("payment_methods/#{id}")
        response
      end

    end
  end
end
