module JurnalApi
  class Client
    # Defines methods related to SalesOrders
    module Vendors

      def vendors(params = {})
        response = get('vendors', params)
        response
      end

      def vendor_find(id)
        response = get("vendors/#{id}")
        response
      end

      def vendor_create(params = {})
        response = post('vendors', params)
        response        
      end

      def vendor_update(id, params = {})
        response = put("vendors/#{id}", params)
        response
      end

      def vendor_delete(id)
        response = delete("vendors/#{id}")
        response
      end

    end
  end
end
