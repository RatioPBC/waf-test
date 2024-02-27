defmodule WafTest.Application do
  use Application

  @impl true
  def start(_type, _args) do
    port = Application.fetch_env!(:waf_test, :port)

    children = [
      {Bandit, plug: WafTest.Plug, port: port, scheme: :http}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: WafTest.Supervisor)
  end
end
