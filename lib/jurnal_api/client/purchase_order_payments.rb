module JurnalApi
  class Client
    # Defines methods related to PurchaseOrderPayment
    module PurchaseOrderPayments

      def purchase_order_payments(params = {})
        response = get('purchase_order_payments', params)
        response
      end

      def purchase_order_payments_find(id)
        response = get("purchase_order_payments/#{id}")
        response
      end

      def purchase_order_payment_create(params = {})
        response = post('purchase_order_payments', params)
        response        
      end

      def purchase_order_payment_update(id, params = {})
        response = patch("purchase_order_payments/#{id}", params)
        response        
      end

      def purchase_order_payment_delete(id)
        response = delete("purchase_order_payments/#{id}")
        response
      end
    end
  end
end