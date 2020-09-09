class UserDelegator < BaseDelegator
  attr_accessor :user
  validate :validate_group_ids

  def initialize(record, options = {})
    @user = record
    super(record, options)
  end

  def validate_group_ids
    # byebug
    x = User.all
    # errors["fd"]<< "invalid_test"
    # (@error_options ||= {}).merge!(fd: { list: [1,2] })
  end


end
