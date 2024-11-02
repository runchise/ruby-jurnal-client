# frozen_string_literal: true

module JurnalApi
  class Client
    # Defines methods related to SalesOrders
    module SalesDeliveries
      def sales_deliveries(params = {})
        response = get('sales_deliveries', params)
        response
      end

      def sales_delivery_find(id)
        response = get("sales_deliveries/#{id}")
        response
      end

      def sales_delivery_create(params = {})
        response = post('sales_deliveries', params)
        response
      end

      def sales_delivery_update(id, params = {})
        response = patch("sales_deliveries/#{id}", params)
        response
      end
      
      def sales_delivery_delete(id)
        response = delete("sales_deliveries/#{id}")
        response
      end

      def sales_delivery_convert_to_invoice(id, params = {})
        url      = "sales_deliveries/#{id}/convert_to_invoice"
        response = post(url, params)

        response
      end
    end
  end
end
