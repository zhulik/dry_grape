# frozen_string_literal: true

rom = ROM.container(:sql, 'postgres://postgres@localhost/dry_grape-development') do |config|
  # define relations and commands here...
end

Container.register(:rom, rom)
