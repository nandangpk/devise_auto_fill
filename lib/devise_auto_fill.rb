# frozen_string_literal: true
require_relative "devise_auto_fill/version"

module DeviseAutoFill
  class Error < StandardError; end
  
  class Engine < ::Rails::Engine
    generators do
      require 'generators/devise_auto_fill/install_generator'
    end
  end

  module Helper
    def set_current_user_id
      Thread.current[:current_user_id] = current_user.id if current_user.present?
    end
  end

  extend ActiveSupport::Concern
  
  private
  
  def devise_auto_fill_on_create
    assign_attributes(created_by: Thread.current[:current_user_id])
    assign_attributes(updated_by: Thread.current[:current_user_id])
  end

  def devise_auto_fill_on_update
    assign_attributes(updated_by: Thread.current[:current_user_id])
  end

  class_methods do
    def devise_auto_fill(*actions)
      actions.each do |action|
        raise "invalid parameter! only: [:create, :update]" if action != "create" and action.to_s != "update"
      end if actions.present?
      if actions.empty? or actions.include? :create
        before_create :devise_auto_fill_on_create
      end
      if actions.empty? or actions.include? :update
        before_update :devise_auto_fill_on_update
      end
    end
  end
end
