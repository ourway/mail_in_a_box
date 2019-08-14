# MailInABox

## Description

Mail In A Box is a simple wrapper for
[MailInABox](https://mailinabox.email?_src=https://github.com/ourway/mail_in_a_box/)
APIs. 

## Installation

Install it by adding `mail_in_a_box` to your list of dependencies in `mix.exs`:

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


## Author

Farsheed Ashouri

## License

MIT
