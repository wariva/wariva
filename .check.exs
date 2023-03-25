[
  tools: [
    {:credo, "mix credo --strict"},
    {:sobelow, "mix sobelow -i Config.HTTPS --exit --skip"},
    {:ex_unit, "mix test --trace --cover",
     detect: [{:file, "test"}], retry: "mix test --trace --failed"}
  ]
]
