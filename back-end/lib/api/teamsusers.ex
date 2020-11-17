defmodule Api.Teamsusers do
  @moduledoc """
  The Teamsusers context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Teamsusers.Teamsuser

  @doc """
  Returns the list of teamsusers.

  ## Examples

      iex> list_teamsusers()
      [%Teamsuser{}, ...]

  """
  def list_teamsusers do
    Repo.all(Teamsuser)
  end

  @doc """
  Gets a single teamsuser.

  Raises `Ecto.NoResultsError` if the Teamsuser does not exist.

  ## Examples

      iex> get_teamsuser!(123)
      %Teamsuser{}

      iex> get_teamsuser!(456)
      ** (Ecto.NoResultsError)

  """
  def get_teamsuser!(id), do: Repo.get!(Teamsuser, id)

  @doc """
  Creates a teamsuser.

  ## Examples

      iex> create_teamsuser(%{field: value})
      {:ok, %Teamsuser{}}

      iex> create_teamsuser(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_teamsuser(attrs \\ %{}) do
    %Teamsuser{}
    |> Teamsuser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a teamsuser.

  ## Examples

      iex> update_teamsuser(teamsuser, %{field: new_value})
      {:ok, %Teamsuser{}}

      iex> update_teamsuser(teamsuser, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_teamsuser(%Teamsuser{} = teamsuser, attrs) do
    teamsuser
    |> Teamsuser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a teamsuser.

  ## Examples

      iex> delete_teamsuser(teamsuser)
      {:ok, %Teamsuser{}}

      iex> delete_teamsuser(teamsuser)
      {:error, %Ecto.Changeset{}}

  """
  def delete_teamsuser(%Teamsuser{} = teamsuser) do
    Repo.delete(teamsuser)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking teamsuser changes.

  ## Examples

      iex> change_teamsuser(teamsuser)
      %Ecto.Changeset{data: %Teamsuser{}}

  """
  def change_teamsuser(%Teamsuser{} = teamsuser, attrs \\ %{}) do
    Teamsuser.changeset(teamsuser, attrs)
  end
end
