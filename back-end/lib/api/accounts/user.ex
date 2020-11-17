defmodule Api.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Accounts.User


  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :password_hash, :string
    belongs_to :role, Api.Roles.Role
    has_many :clock, Api.Clocks.Clock, on_delete: :delete_all
    has_many :working_time, Api.Workingtimes.Workingtime, on_delete: :delete_all
    many_to_many :team, Api.Teams.Team, join_through: "teamsusers"
    
    # Virtual fields:
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation, :firstname, :lastname, :role_id]) # Remove hash, add pw + pw confirmation
    # |> validate_required([:email, :password, :password_confirmation, :firstname, :lastname, :role_id]) # Remove hash, add pw + pw confirmation
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+.[A-Za-z]+$/) # Check that email is valid
    |> validate_length(:password, min: 8) # Check that password length is >= 8 
    |> validate_confirmation(:password) # Check that password === password_confirmation
    |> unique_constraint(:email) 
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, hashpwsalt(pass))
      _ ->
          changeset
    end
  end
end
