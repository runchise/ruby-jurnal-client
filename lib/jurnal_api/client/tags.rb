module JurnalApi
  class Client
    # Defines methods related to ReceivePayment
    module Tags
      def tags(params = {})
        response = get('tags', params)
        response
      end

      def tag_create(params = {})
        response = post('tags', params)
        response
      end

      def tag_find(id)
        response = get("tags/#{id}")
        response
      end
    end
  end
end
