defmodule Api.Repo.Migrations.CreateTeamsusers do
  use Ecto.Migration

  def change do
    create table(:teamsusers) do
    add :team_id, references(:teams)
    add :user_id, references(:users)

    timestamps()
  end
  create unique_index(:teamsusers, [:team_id, :user_id])
  end
end
