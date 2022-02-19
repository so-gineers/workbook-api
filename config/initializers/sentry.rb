Sentry.init do |config|
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 0.5

  # or
  config.traces_sampler = lambda { |context| true }
  config.background_worker_threads = 5
  config.before_send =
    lambda do |event, hint|
      ActiveSupport::ParameterFilter
        .new(Rails.application.config.filter_parameters)
        .filter(event.to_hash)
    end
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.enabled_environments = %w[production heroku]
  config.excluded_exceptions +=
    %w[ActionController::RoutingError ActiveRecord::RecordNotFound]
end
