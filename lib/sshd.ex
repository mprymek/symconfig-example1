defmodule Sshd do
  import SymConfig.Spec
  alias SymConfig, as: SC
  require SC
  require Exlog

  def load(sc) do
    my_cfg = cfg_file "/etc/ssh/sshd_config"
    my_svc = svc_running "sshd"
    [[Os: wos, Ver: wos_ver]] = sc |> SC.query( want(installed(os(Os,Ver))) )
    sc |> SC.assert!([
      peex("/etc/ssh/sshd_config","/etc/ssh/sshd_config","patch-sshd_config",:sshd),
      depends(my_svc,my_cfg),
      depends(my_cfg,os_installed(wos,wos_ver)),
      want(my_svc),
    ])
  end
end

