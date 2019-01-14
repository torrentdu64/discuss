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
        {:ok, post} ->
          conn
          |> put_flash(:info, "well done PaPa")
          |> redirect( to: Routes.topic_path(conn, :index))

        {:error,   changeset } ->
          render  conn, "new.html", changeset: changeset
    end

  end
end
