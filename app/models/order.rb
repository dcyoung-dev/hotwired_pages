# frozen_string_literal: true

class Order < ApplicationRecord
  PENDING_STATE = 'pending'
  READY_STATE = 'ready'
  COMPLETE_STATE = 'complete'
  STATES = [PENDING_STATE, READY_STATE, COMPLETE_STATE].freeze

  validates :status, inclusion: { in: STATES }

  def next_status
    all_states = STATES.dup.concat(STATES)
    current_index = all_states.find_index(status)
    all_states.at(current_index + 1)
  end
end
