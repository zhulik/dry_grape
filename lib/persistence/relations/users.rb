# frozen_string_literal: true

class Persistence::Relations::Users < ROM::Relation[:sql]
  schema :users, infer: true
  auto_struct true
end
