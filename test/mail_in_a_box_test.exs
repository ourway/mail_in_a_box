defmodule MailInABoxTest do
  use ExUnit.Case
  doctest MailInABox

  @emailuser Application.fetch_env!(:mail_in_a_box, :admin_user)
  @domain Application.fetch_env!(:mail_in_a_box, :domain)

  test "get available email accounts" do
    result =
      MailInABox.get_accounts()
      |> Enum.filter(fn x -> x["email"] == @emailuser end)

    assert length(result) == 1
  end

  test "adding/removing email accounts" do
    targetmail = "something@#{@domain}"
    targetpass = "secretisgood"

    assert MailInABox.add_account(targetmail, targetpass) == {:ok, 200}

    chckfn = fn ->
      MailInABox.get_accounts()
      |> Enum.filter(fn x -> x["email"] == targetmail end)
    end

    result = chckfn.()
    assert length(result) == 1

    assert MailInABox.remove_account(targetmail) == {:ok, 200}
  end

  test "handle errors" do
    targetmail = "123"
    targetpass = "secretisgood"

    {:error, 400, desc} = MailInABox.add_account(targetmail, targetpass)
    assert desc =~ "Invalid"
  end
end
