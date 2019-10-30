# frozen_string_literal: true

module Transactions
  module Users
    class Create
      include Dry::Transaction
      include Import['validations.user']
      include Import['persistence.repositories.users']

      step :validate
      step :hash_password
      step :create

      private

      def validate(input)
        # result = user.call(input)
        # return Failure(result.errors) if result.errors.any?

        Success(input)
      end

      def hash_password(input)
        Success(
          input.merge(password_hash: BCrypt::Password.create(input[:password]))
               .except(:password)
        )
      end

      def create(input)
        Success(users.create(input))
      end
    end
  end
end
