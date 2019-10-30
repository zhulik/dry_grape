# frozen_string_literal: true

Application.boot(:persistence, namespace: true) do |_system|
  init do
    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    rom_config = ROM::Configuration.new(
      :sql,
      ENV['DATABASE_URL'],
      extensions: %i[error_sql pg_array pg_json]
    )

    register 'config', rom_config
  end

  start do
    config = container['persistence.config']

    register 'rom', ROM.container(config)
  end
end
