# frozen_string_literal: true

class Persistence::Users < ROM::Relation[:sql]
  schema :users, infer: true
end
