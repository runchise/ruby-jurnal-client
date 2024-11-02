module JurnalApi
  class Client
    # Defines methods related to PurchaseReturn
    module PurchaseReturn

      def purchase_returns(params = {})
        response = get('purchase_returns', params)
        response
      end

      def purchase_return_find(id)
        response = get("purchase_returns/#{id}")
        response
      end

      def purchase_return_create(params = {})
        response = post('purchase_returns', params)
        response        
      end

      def purchase_return_update(id, params = {})
        response = patch("purchase_returns/#{id}", params)
        response
      end

      def purchase_return_delete(id)
        response = delete("purchase_returns/#{id}")
        response
      end

    end
  end
end
