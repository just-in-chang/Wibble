defmodule Wibble.ApiTest do
  use Wibble.DataCase

  alias Wibble.Api

  describe "users" do
    alias Wibble.Api.User

    @valid_attrs %{username: "some username", is_active: true}
    @update_attrs %{username: "some updated username", is_active: false}
    @invalid_attrs %{username: nil, is_active: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Api.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Api.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Api.create_user(@valid_attrs)
      assert user.username == "some username"
      assert user.is_active == true
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Api.update_user(user, @update_attrs)
      assert user.username == "some updated username"
      assert user.is_active == false
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_user(user, @invalid_attrs)
      assert user == Api.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Api.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Api.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Api.change_user(user)
    end
  end

  describe "jobs" do
    alias Wibble.Api.Job

    @valid_attrs %{company: "some company", position: "some position", status: "some status"}
    @update_attrs %{company: "some updated company", position: "some updated position", status: "some updated status"}
    @invalid_attrs %{company: nil, position: nil, status: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Api.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Api.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Api.create_job(@valid_attrs)
      assert job.company == "some company"
      assert job.position == "some position"
      assert job.status == "some status"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, %Job{} = job} = Api.update_job(job, @update_attrs)
      assert job.company == "some updated company"
      assert job.position == "some updated position"
      assert job.status == "some updated status"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_job(job, @invalid_attrs)
      assert job == Api.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Api.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Api.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Api.change_job(job)
    end
  end
end
