defmodule ExUsers.User do
  use ExUsers.Web, :model

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :age, :integer

    timestamps(inserted_at: :created_at, updated_at: :updated_at)
  end

  @required_fields ~w(firstname lastname age)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
