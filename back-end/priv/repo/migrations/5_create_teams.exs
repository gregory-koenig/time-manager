defmodule Api.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team, :string

      timestamps()
    end

  end
end
