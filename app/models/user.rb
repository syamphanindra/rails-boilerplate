class User < ActiveRecord::Base
  has_many :notes, class_name: 'Note', dependent: :destroy

  attr_accessible :email, :first_name, :last_name, :age
  attr_accessor :full_name

  def full_name
    first_name.to_s + last_name.to_s
  end
end
