require "clean_data/version"

module CleanData
  extend ActiveSupport::Concern

  included do
    before_validation :cleanup_data
  end

  private
  def cleanup_data
    # trim whitespace from beginning and end of string attributes
    attribute_names.each do |name|
      if send(name).respond_to?(:strip)
        send("#{name}=", send(name).strip)
      end
    end
  end
end
