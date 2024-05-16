# frozen_string_literal: true

module JurnalApi
  class Client
    # Defines methods related to SalesOrders
    module PurchaseOrders
      def purchase_orders(params = {})
        response = get('purchase_orders', params)
        response
      end

      def purchase_order_find(id)
        response = get("purchase_orders/#{id}")
        response
      end

      def purchase_order_create(params = {})
        response = post('purchase_orders', params)
        response
      end

      def purchase_order_update(id, params = {})
        response = put("purchase_orders/#{id}", params)
        response
      end
      
      def purchase_order_convert_to_invoice(id, params = {})
        url      = "purchase_orders/#{id}/convert_to_invoice"
        response = post(url, params)

        response
      end

      def purchase_order_close(id)
        url      = "purchase_orders/#{id}/close_order"
        response = post(url)

        response
      end

      def purchase_order_purchase_payments(id, params = {})
        get("purchase_orders/#{id}/purchase_order_payments", params)
      end
    end
  end
end
