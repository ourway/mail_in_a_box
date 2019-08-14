# MailInABox

## Description

Mail In A Box is a simple wrapper for (https://mailinabox.email/)[maininabox]
APIs. 

## Installation

If [https://hex.pm/docs/publish](Available in hex), the package can be installed
by adding `mail_in_a_box` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mail_in_a_box, "~> 0.1.0"}
  ]
end
```

## Configuration:

Add your mailbox information in your config file

```elixir
#config/config.exs

...

config :mail_in_a_box,
  admin_user: "guess@me",
  admin_pass: "39uq8k7",
  endpoint: "https://box.me.net",
  domain: "me.net"

...

```


## Testing
I tested the project with `100%` coverage. Please you `mix test --trace` to
see if everything is OK. Bugs reports are welcome.



Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mail_in_a_box](https://hexdocs.pm/mail_in_a_box).




