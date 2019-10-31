# frozen_string_literal: true

module Persistence
  class Repository < ROM::Repository::Root
    # This .new shouldn't be needed, since repos should work with dry-
    # auto_inject. This is not working yet, so this remains as a workaround.
    def self.new(rom = nil)
      super(rom || Application['persistence.rom'])
    end
  end
end
