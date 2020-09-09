class BaseDelegator < SimpleDelegator
  include ActiveModel::Validations
  # include ActiveModel::Validations::Callbacks
  attr_accessor :error_options

  def initialize(record, options = {})
    super(record)
    @error_options = {}
  end
end
