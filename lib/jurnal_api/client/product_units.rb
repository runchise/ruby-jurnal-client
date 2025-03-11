module JurnalApi
  class Client
    # Defines methods related to SalesOrders
    module ProductUnits

      def product_units(params = {})
        response = get('product_units', params)
        response
      end

      def product_unit_find(id)
        response = get("product_units/#{id}")
        response
      end

      def product_unit_create(params = {})
        response = post('product_units', params)
        response        
      end

      def product_unit_update(id, params = {})
        response = patch("product_units/#{id}", params)
        response
      end

      def product_unit_delete(id)
        response = delete("product_units/#{id}")
        response
      end

    end
  end
end
