[
  tools: [
    {:compiler, "mix compile --force"},
    {:credo, "mix credo --strict -a"},
    {:doctor, "mix doctor --config_file=.doctor.exs"},
    {:sobelow, "mix sobelow -i Config.HTTPS --exit --skip"},
    {:ex_unit, "mix coveralls --trace",
     detect: [{:file, "test"}], retry: "mix test --trace --failed"}
  ]
]
