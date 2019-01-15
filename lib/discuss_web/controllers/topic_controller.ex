defmodule DiscussWeb.TopicController do


  use DiscussWeb, :controller





  #alias Discuss.Repo
  alias Discuss.Topic


  def index(conn, _params) do

   alias Discuss.Repo
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end

  def new(conn, _params) do

      #changeset = Discuss.Topic.changeset(%{}, %{})
      changeset = Topic.changeset(%Topic{})
      render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic_params}) do

    alias Discuss.Repo

    changeset = Topic.changeset(%Topic{}, topic_params)


    case Repo.insert(changeset) do
        {:ok, _topic} ->
          conn
          |> put_flash(:info, "well done PaPa")
          |> redirect( to: Routes.topic_path(conn, :index))

        {:error,   changeset } ->
          render  conn, "new.html", changeset: changeset
    end

  end

  def edit(conn, %{"id" => topic_id}) do
    alias Discuss.Repo
    topic = Repo.get( Topic, topic_id)
    changeset = Topic.changeset(topic)
    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn , %{ "id" => topic_id, "topic" => topic}) do
    alias Discuss.Repo
    old_topic = Repo.get(Topic, topic_id)
     changeset = Topic.changeset(old_topic ,topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "update")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, topic: old_topic

    end
  end

  def delete(conn , %{ "id" => topic_id}) do
    alias Discuss.Repo
    Repo.get!(Topic, topic_id) |> Repo.delete!

    conn
    |> put_flash(:info, "topic delete")
    |> redirect(to: Routes.topic_path(conn, :index))

  end

end
