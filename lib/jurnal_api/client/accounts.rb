module JurnalApi
  class Client
    # Defines methods related to ReceivePayment
    module Account
      def accounts(params = {})
        response = get('accounts', params)
        response
      end

      def account_find(id)
        response = get("accounts/#{id}")
        response
      end

    end
  end
end
