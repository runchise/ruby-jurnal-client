module JurnalApi
  class Client
    # Defines methods related to Taxes
    module Taxes

      def taxes(params = {})
        response = get('taxes', params)
        response
      end

      def tax_create(params = {})
        response = post('taxes', params)
        response
      end

      def tax_update(params = {})
        response = patch("taxes/#{id}", params)
        response
      end

      def tax_find(id)
        response = get("taxes/#{id}")
        response
      end
    end
  end
end