# frozen_string_literal: true

module Persistence
  module Repositories
    class Users < ROM::Repository[:users]
      commands :create, update: :by_pk, delete: :by_pk

      def all
        users.to_a
      end

      def by_username(username)
        users.where(username: username).one
      end
    end
  end
end
