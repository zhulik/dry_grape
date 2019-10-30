# frozen_string_literal: true

module Validations
  class User < Dry::Validation::Contract
    schema do
      required(:username).value(:string)
      required(:password).value(:string)
    end

    rule(:username) do
      key.failure('length must be >= 5') if value.length < 5
    end

    rule(:username) do
      key.failure('already taken') if Application['persistence.repositories.users'].by_username(value).present?
    end

    rule(:password) do
      key.failure('length must be >= 5') if value.length < 5
    end
  end
end
