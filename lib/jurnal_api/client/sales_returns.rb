module JurnalApi
  class Client
    # Defines methods related to PurchaseReturn
    module SalesReturn

      def sales_returns(params = {})
        response = get('sales_returns', params)
        response
      end

      def sales_return_find(id)
        response = get("sales_returns/#{id}")
        response
      end

      def sales_return_create(params = {})
        response = post('sales_returns', params)
        response        
      end

      def sales_return_update(id, params = {})
        response = put("sales_returns/#{id}", params)
        response
      end

      def sales_return_delete(id)
        response = delete("sales_returns/#{id}")
        response
      end

    end
  end
end
