# frozen_string_literal: true

module Api
  module V1
    module Me
      class FollowingActivitiesIndexParams
        include ActiveParameter

        param :fields
        param :filter_actions
        param :filter_muted
        param :page, default: 1
        param :per_page, default: 25
        param :sort_id

        validates :fields,
          allow_blank: true,
          fields_params: true
        validates :filter_actions,
          allow_blank: true,
          inclusion: {
            in: %w(create_record create_multiple_records create_status)
          }
        validates :filter_muted,
          allow_blank: true,
          filter_boolean_params: true
        validates :per_page,
          allow_blank: true,
          numericality: {
            only_integer: true,
            greater_than_or_equal_to: 1,
            less_than_or_equal_to: 50
          }
        validates :page,
          allow_blank: true,
          numericality: {
            only_integer: true,
            greater_than_or_equal_to: 1
          }
        validates :sort_id,
          allow_blank: true,
          sort_params: true
      end
    end
  end
end
