defmodule DiscussWeb.TopicController do


  use DiscussWeb, :controller
  #alias DiscussWeb.Topic

  def new(conn, params) do

      #changeset = Discuss.Topic.changeset(%{}, %{})
      render conn, "new.html"
  end
end
