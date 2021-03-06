defmodule WibbleWeb.JobView do
  use WibbleWeb, :view
  alias WibbleWeb.JobView

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{
      id: job.id,
      company: job.company,
      position: job.position,
      status: job.status,
      link: job.link
    }
  end
end
