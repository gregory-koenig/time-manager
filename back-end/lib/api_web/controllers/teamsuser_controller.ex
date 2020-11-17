defmodule ApiWeb.TeamsuserController do
  use ApiWeb, :controller

  alias Api.Teamsusers
  alias Api.Teamsusers.Teamsuser

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    teamsusers = Teamsusers.list_teamsusers()
    render(conn, "index.json", teamsusers: teamsusers)
  end

  def create(conn, %{"teamsuser" => teamsuser_params}) do
    with {:ok, %Teamsuser{} = teamsuser} <- Teamsusers.create_teamsuser(teamsuser_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.teamsuser_path(conn, :show, teamsuser))
      |> render("show.json", teamsuser: teamsuser)
    end
  end

  def show(conn, %{"id" => id}) do
    teamsuser = Teamsusers.get_teamsuser!(id)
    render(conn, "show.json", teamsuser: teamsuser)
  end

  def update(conn, %{"id" => id, "teamsuser" => teamsuser_params}) do
    teamsuser = Teamsusers.get_teamsuser!(id)

    with {:ok, %Teamsuser{} = teamsuser} <- Teamsusers.update_teamsuser(teamsuser, teamsuser_params) do
      render(conn, "show.json", teamsuser: teamsuser)
    end
  end

  def delete(conn, %{"id" => id}) do
    teamsuser = Teamsusers.get_teamsuser!(id)

    with {:ok, %Teamsuser{}} <- Teamsusers.delete_teamsuser(teamsuser) do
      send_resp(conn, :no_content, "")
    end
  end
end
