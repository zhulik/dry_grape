# frozen_string_literal: true

class Transactions::Users::Create
  include Dry::Transaction

  step :validate
  step :hash_password
  step :create

  private

  def validate(input)
    result = Container['user.validate'].call(input)
    return Failure(result.errors) if result.errors.any?

    Success(result.values.data)
  end

  def hash_password(input)
    Success(
      input.merge(password_hash: BCrypt::Password.create(input[:password]))
           .except(:password)
    )
  end

  def create(input)
    Success(System[:users_repo].create(input))
  end
end
