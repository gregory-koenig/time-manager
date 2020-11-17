defmodule ApiWeb.TeamsuserControllerTest do
  use ApiWeb.ConnCase

  alias Api.Teamsusers
  alias Api.Teamsusers.Teamsuser

  @create_attrs %{
    team_id: 42,
    user_id: 42
  }
  @update_attrs %{
    team_id: 43,
    user_id: 43
  }
  @invalid_attrs %{team_id: nil, user_id: nil}

  def fixture(:teamsuser) do
    {:ok, teamsuser} = Teamsusers.create_teamsuser(@create_attrs)
    teamsuser
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all teamsusers", %{conn: conn} do
      conn = get(conn, Routes.teamsuser_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create teamsuser" do
    test "renders teamsuser when data is valid", %{conn: conn} do
      conn = post(conn, Routes.teamsuser_path(conn, :create), teamsuser: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.teamsuser_path(conn, :show, id))

      assert %{
               "id" => id,
               "team_id" => 42,
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.teamsuser_path(conn, :create), teamsuser: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update teamsuser" do
    setup [:create_teamsuser]

    test "renders teamsuser when data is valid", %{conn: conn, teamsuser: %Teamsuser{id: id} = teamsuser} do
      conn = put(conn, Routes.teamsuser_path(conn, :update, teamsuser), teamsuser: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.teamsuser_path(conn, :show, id))

      assert %{
               "id" => id,
               "team_id" => 43,
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, teamsuser: teamsuser} do
      conn = put(conn, Routes.teamsuser_path(conn, :update, teamsuser), teamsuser: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete teamsuser" do
    setup [:create_teamsuser]

    test "deletes chosen teamsuser", %{conn: conn, teamsuser: teamsuser} do
      conn = delete(conn, Routes.teamsuser_path(conn, :delete, teamsuser))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.teamsuser_path(conn, :show, teamsuser))
      end
    end
  end

  defp create_teamsuser(_) do
    teamsuser = fixture(:teamsuser)
    %{teamsuser: teamsuser}
  end
end
