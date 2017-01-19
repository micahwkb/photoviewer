class User < ApplicationRecord
  has_many  :authorizations
  validates :name, :email, presence: true

  def self.find_or_create_by_params(params)

  end
end
