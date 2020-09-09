class UserValidation
  include UserConstants
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  PERMITTED_PARAMS = %w[email first_name last_name age]
  attr_accessor :first_name, :last_name, :email, :error_options, :request_params, :age
  # validates :first_name, data_type: { rules: String, required: true }
  validates :first_name, presence: true, length: { maximum: 100 }
  validate :test_validate
  # validates :last_name, data_type: { rules: String, required: true }

  def initialize(request_params, options)
    self.request_params = request_params
    PERMITTED_PARAMS.each do |param|
      public_send("#{param}=", request_params[param]) if request_params.key?(param)
    end
  end

  def test_validate
  end
end
