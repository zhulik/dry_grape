# frozen_string_literal: true

Factory = ROM::Factory.configure do |c|
  c.rom = Application['persistence.rom']
end

Factory.define(:user) do |f|
  f.username { fake(:internet, :username) }
  f.password_hash { 'some password hash' }
end
