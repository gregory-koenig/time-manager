defmodule Api.TeamsusersTest do
  use Api.DataCase

  alias Api.Teamsusers

  describe "teamsusers" do
    alias Api.Teamsusers.Teamsuser

    @valid_attrs %{team_id: 42, user_id: 42}
    @update_attrs %{team_id: 43, user_id: 43}
    @invalid_attrs %{team_id: nil, user_id: nil}

    def teamsuser_fixture(attrs \\ %{}) do
      {:ok, teamsuser} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Teamsusers.create_teamsuser()

      teamsuser
    end

    test "list_teamsusers/0 returns all teamsusers" do
      teamsuser = teamsuser_fixture()
      assert Teamsusers.list_teamsusers() == [teamsuser]
    end

    test "get_teamsuser!/1 returns the teamsuser with given id" do
      teamsuser = teamsuser_fixture()
      assert Teamsusers.get_teamsuser!(teamsuser.id) == teamsuser
    end

    test "create_teamsuser/1 with valid data creates a teamsuser" do
      assert {:ok, %Teamsuser{} = teamsuser} = Teamsusers.create_teamsuser(@valid_attrs)
      assert teamsuser.team_id == 42
      assert teamsuser.user_id == 42
    end

    test "create_teamsuser/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teamsusers.create_teamsuser(@invalid_attrs)
    end

    test "update_teamsuser/2 with valid data updates the teamsuser" do
      teamsuser = teamsuser_fixture()
      assert {:ok, %Teamsuser{} = teamsuser} = Teamsusers.update_teamsuser(teamsuser, @update_attrs)
      assert teamsuser.team_id == 43
      assert teamsuser.user_id == 43
    end

    test "update_teamsuser/2 with invalid data returns error changeset" do
      teamsuser = teamsuser_fixture()
      assert {:error, %Ecto.Changeset{}} = Teamsusers.update_teamsuser(teamsuser, @invalid_attrs)
      assert teamsuser == Teamsusers.get_teamsuser!(teamsuser.id)
    end

    test "delete_teamsuser/1 deletes the teamsuser" do
      teamsuser = teamsuser_fixture()
      assert {:ok, %Teamsuser{}} = Teamsusers.delete_teamsuser(teamsuser)
      assert_raise Ecto.NoResultsError, fn -> Teamsusers.get_teamsuser!(teamsuser.id) end
    end

    test "change_teamsuser/1 returns a teamsuser changeset" do
      teamsuser = teamsuser_fixture()
      assert %Ecto.Changeset{} = Teamsusers.change_teamsuser(teamsuser)
    end
  end
end
