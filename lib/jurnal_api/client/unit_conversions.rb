module JurnalApi
  class Client
    # Defines methods related to ReceivePayment
    module UnitConversions

      def unit_conversions(params = {})
        response = get('bank_transfers', params)
        response
      end

      def unit_conversion_create(params = {})
        response = post('unit_conversions', params)
        response        
      end
    end
  end
end
