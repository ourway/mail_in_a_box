defmodule MIAB.IMAP do
  @moduledoc false
  @settings Application.get_env(:mail_in_a_box, __MODULE__)
  for {_k, _v} <- @settings do
    :pass
    # :ok = Application.put_env(:eximap, k, v)
  end
end
