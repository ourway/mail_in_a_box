defmodule MIAB.Admin do
  @moduledoc """
    MIAB email account administration.
    Adding/removing new email accounts dynamicly with this module is possible.

    For adding a new account:
      {:ok, account_info} = MIAB.Admin.add_account("something", "secret")

    Removing account:
      :ok = MIAB.Admin.remove_account("something")
  """
  @settings Application.get_env(:mail_in_a_box, __MODULE__)
  @adminuser @settings[:admin_user]
  @adminpass @settings[:admin_pass]
  @endpoint @settings[:endpoint]
  @domain @settings[:domain]
  @authheader {'Authorization', 'Basic #{Base.encode64(@adminuser <> ":" <> @adminpass)}'}

  @doc "gets list of email accounts with their status"
  @spec get_accounts() :: map()
  def get_accounts do
    url = "#{@endpoint}/admin/mail/users?format=json" |> to_charlist

    {_, {{_, _status_code, _}, _headers, body}} =
      :httpc.request(:get, {url, [@authheader]}, [], [])

    {:ok, result} = body |> Jason.decode()

    result
    |> Enum.filter(fn x -> x |> Map.get("domain") == @domain end)
    |> List.last()
    |> Map.get("users")
  end

  @doc """
    Add a new email account if not already available.

    {:ok, account_info} = 
        MIAB.Admin.add_account("something@english-learning.ir", "secret")
    
    Returns {:error, reason} in case of error.

  """
  @spec add_account(String.t(), String.t()) ::
          {:ok, 200} | {:error, integer(), String.t()}
  def add_account(email, pass) do
    contenttype = 'application/x-www-form-urlencoded; charset=utf8'
    email = URI.encode_www_form(email)
    pass = URI.encode_www_form(pass)
    data = "email=#{email}&password=#{pass}"
    url = "#{@endpoint}/admin/mail/users/add" |> to_charlist

    {_, {{_, status_code, _}, _headers, body}} =
      :httpc.request(:post, {url, [@authheader], contenttype, data}, [], [])

    case status_code do
      200 ->
        {:ok, 200}

      _ ->
        {:error, status_code, body |> to_string}
    end
  end

  @doc """
    Removes an email account
      :ok = MIAB.Admin.remove_account("something@english-learning.ir")

    Returns {:error, reason} in case of error.

  """
  @spec remove_account(String.t()) ::
          {:ok, 200} | {:error, integer(), String.t()}
  def remove_account(email) do
    url = "#{@endpoint}/admin/mail/users/remove" |> to_charlist
    contenttype = 'application/x-www-form-urlencoded; charset=utf8'
    email = URI.encode_www_form(email)
    data = "email=#{email}"

    {_, {{_, status_code, _}, _headers, body}} =
      :httpc.request(:post, {url, [@authheader], contenttype, data}, [], [])

    case status_code do
      200 ->
        {:ok, 200}

      _ ->
        {:error, status_code, body |> to_string}
    end
  end
end
