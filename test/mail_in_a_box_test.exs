defmodule MailInABoxTest do
  use ExUnit.Case
  doctest MailInABox

  test "greets the world" do
    assert MailInABox.hello() == :world
  end
end
