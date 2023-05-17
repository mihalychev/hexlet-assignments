# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.attr_reader :attributes
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attribute(name, options = {})
      attributes_options[name] = options

      define_method name do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = transform_value(value, options[:type])
      end
    end

    def attributes_options
      @attributes_options ||= {}
    end
  end

  def initialize(attrs = {})
    @attributes = {}
    self.class.attributes_options.each do |name, options|
      method("#{name}=").call(attrs[name] || options[:default])
    end
  end

  private

  def transform_value(value, type)
    return if value.nil?
    return value if type.nil?

    case type.to_sym
    when :string then value.to_s
    when :integer then value.to_i
    when :datetime then DateTime.parse(value)
    when :boolean then !!value
    end
  end
end
# END
