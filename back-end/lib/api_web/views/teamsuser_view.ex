defmodule ApiWeb.TeamsuserView do
  use ApiWeb, :view
  alias ApiWeb.TeamsuserView

  def render("index.json", %{teamsusers: teamsusers}) do
    %{data: render_many(teamsusers, TeamsuserView, "teamsuser.json")}
  end

  def render("show.json", %{teamsuser: teamsuser}) do
    %{data: render_one(teamsuser, TeamsuserView, "teamsuser.json")}
  end

  def render("teamsuser.json", %{teamsuser: teamsuser}) do
    %{id: teamsuser.id,
      team_id: teamsuser.team_id,
      user_id: teamsuser.user_id}
  end
end
