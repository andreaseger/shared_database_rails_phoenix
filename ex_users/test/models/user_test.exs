defmodule ExUsers.UserTest do
  use ExUsers.ModelCase

  alias ExUsers.User

  @valid_attrs %{age: 42, firstname: "some content", lastname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
