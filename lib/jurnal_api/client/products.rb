module JurnalApi
  class Client
    # Defines methods related to Products
    module Products

      def products(params = {})
        response = get('products', params)
        response
      end

      def product_create(id, params = {})
        response = post('products', params)
        response
      end

      def product_update(id, params = {})
        response = patch("products/#{id}", params)
        response
      end

      def product_find(id)
        response = get("products/#{id}")
        response
      end

      def product_unit_conversions(id)
        response = get("products/#{id}/unit_conversions")
        response
      end

      def product_delete(id)
        response = delete("products/#{id}")
        response
      end
    end
  end
end