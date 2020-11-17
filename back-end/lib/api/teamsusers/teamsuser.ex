defmodule Api.Teamsusers.Teamsuser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teamsusers" do
    field :team_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(teamsuser, attrs) do
    teamsuser
    |> cast(attrs, [:team_id, :user_id])
    |> validate_required([:team_id, :user_id])
  end
end
