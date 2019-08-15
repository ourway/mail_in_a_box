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
    {:mail_in_a_box, "~> 0.2.0"}
  ]
end
```

## Configuration:

Add your mailbox information in your config file

```elixir
#config/config.exs

...

config :mail_in_a_box, MIAB.Admin,
  admin_user: "guess@example.org",
  admin_pass: "39uq8k7SW8",
  endpoint: "https://box.example.org",
  domain: "example.org"

config :mail_in_a_box, MIAB.IMAP,
  account: "noreply@example.org",
  password: "14de0ea2-6187",
  use_ssl: false,
  incoming_mail_server: "box.example.org",
  incoming_port: 993

config :mail_in_a_box, MIAB.Sender,
  adapter: Swoosh.Adapters.SMTP,
  relay: "box.example.org",
  username: "noreply@example.org",
  password: "bbe8-33690cfbfeff",
  ssl: false,
  tls: :always,
  auth: :always,
  port: 587,
  no_mx_lookups: false,
  retries: 2

config :mail_in_a_box, MIAB.Send,
  ## Sender information
  email: "noreply@example.org",
  from: "Iranian English Learning Platform",
  org: "Iranian English Learning Mock Tests Center",
  org_email: "info@example.org",
  org_webiste: "https://example.org",
  # user email will be appended to unsub url
  unsub_url: "https://pte.example.org/api/v1/emails/unsubscribe/",
  signature: "\nRegards,\nYour English Learning Platform Team."
...

```


## Usage

```elixir

MIAB.Send.welcome(%{name: "your name", email: "you@mail.com"})

```

## Testing

I tested the project with `100%` coverage. Please you `mix test --trace` to
see if everything is OK. Bugs reports are welcome.


## Author

Farsheed Ashouri

## License

MIT
