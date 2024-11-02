# frozen_string_literal: true

module JurnalApi
  class Client
    # Defines methods related to purchase invoice
    module PurchaseInvoices

      def purchase_invoices(params = {})
        response = get('purchase_invoices', params)
        response
      end

      def purchase_invoice_find(id)
        response = get("purchase_invoices/#{id}")
        response
      end

      def purchase_invoice_create(params = {})
        response = post('purchase_invoices', params)
        response
      end

      def purchase_invoice_update(id, params = {})
        response = patch("purchase_invoices/#{id}", params)
        response
      end

      def purchase_invoice_delete(id)
        response = delete("purchase_invoices/#{id}")
        response
      end

      def purchase_invoice_receive_payments(id, params = {})
        get("purchase_invoices/#{id}/purchase_payments", params)
      end
    end
  end
end
