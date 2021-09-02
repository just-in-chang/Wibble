defmodule WibbleWeb.UserController do
  use WibbleWeb, :controller

  alias Wibble.Api
  alias Wibble.Api.User

  action_fallback WibbleWeb.FallbackController

  def index(conn, _params) do
    users = Api.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Api.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Api.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Api.get_user!(id)

    with {:ok, %User{} = user} <- Api.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Api.get_user!(id)

    with {:ok, %User{}} <- Api.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def login(conn, %{"username" => username, "password" => password}) do
    Wibble.Api.authenticate_user(username, password)
    |> login_result(conn)
  end

  defp login_result({:ok, user}, conn) do
    conn
    |> put_status(:ok)
    |> render("success.json", user: user)
  end

  defp login_result({_, message}, conn) do
    conn
    |> put_status(:unauthorized)
    |> render("fail.json", message: message)
  end
end
