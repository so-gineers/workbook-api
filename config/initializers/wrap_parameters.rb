# frozen_string_literal: true

ActiveSupport.on_load(:action_controller) { wrap_parameters format: [:json] }
