defmodule Discuss.Topic do

  use Ecto.Schema
  import Ecto
  import Ecto.Changeset
  import Ecto.Query
  # alias Discuss.Topic
  #use Discuss.Web , :model

  schema "topics" do
    field :title, :string
  end

  def changeset(topic, params \\ %{}) do
    topic
    |> cast( params, [:title])
    |> validate_required([:title])
  end
end
