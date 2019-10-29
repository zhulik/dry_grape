# frozen_string_literal: true

class Persistence::Repositories::UsersRepository < ROM::Repository[:users]
  commands :create, update: :by_pk, delete: :by_pk

  def all
    users.to_a
  end

  def by_username(username)
    users.where(username: username).one!
  end
end

Container.register(:users_repo, Persistence::Repositories::UsersRepository.new(Container[:rom]))
