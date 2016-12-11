defmodule ExUsers.UserView do
  use ExUsers.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, ExUsers.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, ExUsers.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      firstname: user.firstname,
      lastname: user.lastname,
      age: user.age,
      created_at: user.created_at,
      updated_at: user.updated_at
    }
  end
end
