# frozen_string_literal: true

class Validations::User < Dry::Validation::Contract
  schema do
    required(:username).value(:string)
    required(:password).value(:string)
  end

  rule(:username) do
    key.failure('length must be >= 5') if value.length < 5
  end

  rule(:username) do
    key.failure('already taken') if Container['users_repo'].by_username(value).present?
  end

  rule(:password) do
    key.failure('length must be >= 5') if value.length < 5
  end
end

Container.register('user.validate', Validations::User.new)
