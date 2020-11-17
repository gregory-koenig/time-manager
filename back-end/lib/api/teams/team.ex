defmodule Api.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :team, :string
    many_to_many :user, Api.Accounts.User, join_through: "teamsusers"
    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:team])
    |> validate_required([:team])
  end
end
