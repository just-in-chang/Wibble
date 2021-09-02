defmodule WibbleWeb.UserView do
  use WibbleWeb, :view
  alias WibbleWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username}
  end

  def render("success.json", %{user: user}) do
    %{
      success: true,
      id: user.id
    }
  end

  def render("fail.json", _) do
    %{
      success: false
    }
  end
end
