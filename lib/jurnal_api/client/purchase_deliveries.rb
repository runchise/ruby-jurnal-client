# frozen_string_literal: true

module JurnalApi
  class Client
    # Defines methods related to SalesOrders
    module PurchaseDeliveries
      def purchase_deliveries(params = {})
        response = get('purchase_deliveries', params)
        response
      end

      def purchase_delivery_find(id)
        response = get("purchase_deliveries/#{id}")
        response
      end

      def purchase_delivery_create(params = {})
        response = post('purchase_deliveries', params)
        response
      end

      def purchase_delivery_update(id, params = {})
        response = put("purchase_deliveries/#{id}", params)
        response
      end
      
      def purchase_delivery_delete(id)
        response = delete("purchase_deliveries/#{id}")
        response
      end

      def purchase_delivery_convert_to_invoice(id, params = {})
        url      = "purchase_deliveries/#{id}/convert_to_invoice"
        response = post(url, params)

        response
      end
    end
  end
end
