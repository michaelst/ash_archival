defmodule AshArchival.DocIndex do
  @moduledoc false

  use Spark.DocIndex,
    otp_app: :ash_archival,
    guides_from: [
      "documentation/**/*.md"
    ]

  @impl true
  @spec for_library() :: String.t()
  def for_library, do: "ash_archival"

  @impl true
  def extensions do
    [
      %{
        module: AshArchival.Resource,
        name: "Resource Archival",
        default_for_target?: false,
        target: "Ash.Resource",
        type: "Resource"
      }
    ]
  end

  @impl true
  def code_modules do
    [
      {"Introspection",
       [
         AshArchival.Resource.Info
       ]}
    ]
  end
end
