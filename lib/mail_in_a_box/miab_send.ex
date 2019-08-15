defmodule MIAB.Send do
  @moduledoc """
    Provides email sending functionalities
  """

  @setting Application.get_env(:mail_in_a_box, __MODULE__)

  import Swoosh.Email
  alias MIAB.Sender
  @template Path.join(:code.priv_dir(:mail_in_a_box), "email.html.eex")

  @doc """
  sends welcome message to new user.

  User must be a map containing email and name of the user

  Example:
    iex> MIAB.Send.welcome(%{name: "Farsheed", email: "me@example.com"})
         :ok

  """
  def welcome(user) do
    message = """
      Your registeration process is approved and completed.  Congrats!
    """

    mail_html = get_html(user, message)

    send(
      user,
      "Welcome to #{@setting[:org]} website",
      mail_html,
      message
    )
  end

  def get_html(user, message) do
    EEx.eval_file(@template,
      message: message,
      name: user.name,
      email: user.email,
      org: @setting[:org],
      org_email: @setting[:org_email],
      org_website: @setting[:org_website],
      unsub_url: @setting[:unsub_url],
      signature: @setting[:signature]
    )
  end

  def send(user, mail_subject, mail_html, mail_text) do
    resp =
      new()
      |> to({user.name, user.email})
      |> from({@setting[:from], @setting[:email]})
      |> subject(mail_subject)
      |> html_body(mail_html)
      |> text_body(mail_text <> @setting[:signature])
      |> Sender.deliver()

    case resp do
      {:ok, _} ->
        :ok

      {:error, _} ->
        :error
    end
  end
end
