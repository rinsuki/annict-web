# frozen_string_literal: true

module Canary
  module Resolvers
    class LibraryEntries < Canary::Resolvers::Base
      def resolve(status_kinds: nil, order_by: nil)
        order = Canary::OrderProperty.build(order_by)
        user = object

        library_entries = user.library_entries.with_not_deleted_work

        if status_kinds
          library_entries = library_entries.with_status(status_kinds.map { |kind| Status.kind_v3_to_v2(kind.downcase) })
        end

        library_entries = case order.field
        when :last_checked_at
          library_entries.order(position: order.direction)
        else
          library_entries.order(created_at: :asc)
        end

        library_entries
      end
    end
  end
end
