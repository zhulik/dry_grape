# frozen_string_literal: true

module Transactions
  module Users
    class Create
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      include Import[validator: 'validations.users.create']
      include Import[repo: 'persistence.repositories.users']

      def call(params)
        values = yield validate(params)
        values = yield hash_password(values.to_h)
        user = yield create(values)

        Success(user)
      end

      private

      def validate(input)
        validator.call(input).to_monad
      end

      def hash_password(input)
        Success(
          input.merge(password_hash: BCrypt::Password.create(input[:password]))
               .except(:password)
        )
      end

      def create(input)
        Success(repo.create(input))
      end
    end
  end
end
