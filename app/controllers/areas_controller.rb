class AreasController < ApplicationController
  before_action :set_area_type

  def show
    filters = filters_for_type(@area_type)

    @sidebar_filter = filters[:sidebar_filter]
    @main_filter = filters[:main_filter]
  end

  private

  def filters_for_type(area_type)
    filter = {
      counter: {
        sidebar_filter: Order::PENDING_STATE,
        main_filter: Order::READY_STATE
      },
      service: {
        sidebar_filter: Order::READY_STATE,
        main_filter: Order::COMPLETE_STATE
      }
    }

    filter.fetch(area_type)
  end

  def set_area_type
    @area_type ||= params.fetch(:area_type).to_sym
  end
end
