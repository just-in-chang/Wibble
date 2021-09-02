defmodule WibbleWeb.JobController do
  use WibbleWeb, :controller

  alias Wibble.Api
  alias Wibble.Api.Job

  action_fallback WibbleWeb.FallbackController

  def index(conn, _params) do
    jobs = Api.list_jobs()
    render(conn, "index.json", jobs: jobs)
  end

  def create(conn, %{"job" => job_params}) do
    with {:ok, %Job{} = job} <- Api.create_job(job_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.job_path(conn, :show, job))
      |> render("show.json", job: job)
    end
  end

  def show(conn, %{"id" => id}) do
    job = Api.get_job!(id)
    render(conn, "show.json", job: job)
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    job = Api.get_job!(id)

    with {:ok, %Job{} = job} <- Api.update_job(job, job_params) do
      render(conn, "show.json", job: job)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Api.get_job!(id)

    with {:ok, %Job{}} <- Api.delete_job(job) do
      send_resp(conn, :no_content, "")
    end
  end
end
