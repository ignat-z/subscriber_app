defmodule SubscriberApp.SubscriberTest do
  use ExUnit.Case

  alias SubscriberApp.Subscriber

  @valid_attrs %{email: "a@b.com"}
  @invalid_email_attrs %{email: "aaa"}

  test "changeset with valid attrs" do
    changeset = Subscriber.changeset(%Subscriber{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid email" do
    changeset = Subscriber.changeset(%Subscriber{}, @invalid_email_attrs)
    refute changeset.valid?
  end

  test "empty changeset" do
    changeset = Subscriber.changeset(%Subscriber{}, @invalid_email_attrs)
    refute changeset.valid?
  end
end
