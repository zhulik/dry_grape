# frozen_string_literal: true

rom = ROM.container(:sql, 'postgres://postgres@localhost/dry_grape-development') do |config|
  config.register_relation(Persistence::Relations::Users)
end

System.register(:rom, rom)
