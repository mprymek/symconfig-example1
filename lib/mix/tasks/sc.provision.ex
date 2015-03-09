defmodule Mix.Tasks.Sc.Provision do
  use Mix.Task

  @shortdoc "Provision the server."

  def run([]) do
    :ok = Application.ensure_started(:ssh)
    Spec.provision
  end
end
