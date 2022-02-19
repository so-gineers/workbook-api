# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::API
  # Add a known service to the list of services used by the inheriting
  # controller.
  # @param name [String] will be used as value for the name the setter and
  #   getter methods that will we defined when add_service will be invoked
  #   in a controller class.
  # @param service_class [Object] an class that will be instanciated and
  #   associated to newly defined method
  # @example
  #   class MyController < ApplicationController
  #      add_service :my_service, MyService
  #
  #      def create
  #         my_service.do_some_work(...)
  #         ...
  #      end
  #   end
  def self.add_service(name, service_class)
    define_method name do
      if instance_variable_defined?("@#{name}")
        return instance_variable_get("@#{name}")
      end

      instance_variable_set "@#{name}", service_class.new
    end
  end
end
