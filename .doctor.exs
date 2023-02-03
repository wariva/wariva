%Doctor.Config{
  ignore_modules: [
    WarivaWeb,
    WarivaWeb.Endpoint,
    WarivaWeb.Router,
    WarivaWeb.Telemetry
  ],
  ignore_paths: [
    ~r/lib\/wariva_web\/views/,
    ~r/lib\/wariva_web\/controllers/,
    ~r/lib\/wariva\/mailer\/views/,
    ~r/lib\/wariva_web\/live/,
    ~r/test\/support/
  ],
  min_module_doc_coverage: 40,
  min_module_spec_coverage: 0,
  min_overall_doc_coverage: 50,
  min_overall_moduledoc_coverage: 100,
  min_overall_spec_coverage: 0,
  exception_moduledoc_required: true,
  raise: false,
  reporter: Doctor.Reporters.Full,
  struct_type_spec_required: true,
  umbrella: false,
  failed: false
}
