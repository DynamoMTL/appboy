module Appboy
  module REST
    class SendMessages < Base
      attr_reader :app_group_id, :messages, :external_user_ids, :segment_id, :campaign_id

      def initialize(app_group_id, messages: [], external_user_ids: [], campaign_id: nil, segment_id: nil)
        @app_group_id = app_group_id
        @messages = messages
        @external_user_ids = external_user_ids
        @campaign_id = campaign_id
        @segment_id = segment_id
      end

      def perform
        http.post '/messages/send', {
          app_group_id:      app_group_id,
          messages:          messages,
          external_user_ids: external_user_ids,
          campaign_id: campaign_id,
          segment_ids:       [segment_id].compact
        }
      end
    end
  end
end
