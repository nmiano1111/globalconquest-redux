defmodule Globalconq.UserTest do
  use Globalconq.ModelCase

  alias Globalconq.User

  @valid_attrs %{email: "some content", is_admin: true, name: "some content", password_hash: "some content", salt: "some content"}
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