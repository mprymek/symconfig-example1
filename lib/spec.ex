defmodule Spec do
  use SymConfig.Spec
  require Logger
  require Exlog

  @host "127.0.0.1"
  @user "root"
  @port 2222

  @os_ver "10.1-RELEASE-p4-amd64-vagrant"

  @variables %{
      nginx: [
        port: 80,
        server: "www.example.com",
      ],
      sshd: [
        ports: [22,3333,3334],
      ],
    }

  def spec do
    SC.init(@variables,@host, @user, @port, [silently_accept_hosts: true])
       |> global_config
       |> Repo.load
       |> FreeBSD.load(@os_ver)
       |> Nginx.load
       |> Sshd.load
  end

  def global_config(sc) do
    varset_facts = @variables |> Enum.map(fn
      {varset,content} ->
        varset_hash(varset,:erlang.phash2(content))
    end)
    sc |> SC.assert!([
      latest(patch("patch-nginx.conf","0001")),
      latest(patch("patch-index.html","0001")),
      latest(patch("patch-sshd_config","0001")),
    ]) |> SC.assert!(varset_facts)
  end
end
