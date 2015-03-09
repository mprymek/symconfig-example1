defmodule FreeBSD do
  @moduledoc """
  This module simulates facts generated from mtree files. For mtree files see: https://github.com/mprymek/mtrees
  """
  import SymConfig.Spec

  @latest "10.1-RELEASE-p4-amd64"

  def load(sc,"10.1-RELEASE-p4-amd64-vagrant") do
    os_ver="10.1-RELEASE-p4-amd64"
    facts = common(os_ver)++[
      file(os(:freebsd,os_ver),"/etc/ssh/sshd_config",0,0,644,[:uarch],4046,"4355a9d2f26b3329f0b0008fe9d63b4f03b82235cc0bc8c0448366f18b384ce1"),
    ]
    sc |> SymConfig.assert!(facts) |> load_latest
  end
  def load(sc,os_ver="10.1-RELEASE-p4-amd64") do
    facts = common(os_ver)++[
      file(os(:freebsd,os_ver),"/etc/ssh/sshd_config",0,0,644,[:uarch],4046,"26748c51687fe4f09ac6c8ace864d0c545f1fc0aa059bb9bffd80f80c0d62d85"),
    ]
    sc |> SymConfig.assert!(facts) |> load_latest
  end
  def load(_,ver) do
    raise "FreeBSD ver. #{inspect ver} is not available"
  end

  defp common(os_ver="10.1-RELEASE-p4-amd64") do
    my_os = os :freebsd, os_ver
    [
      dir(my_os,"/",0,0,755,[:uarch]),
      dir(my_os,"/etc",0,0,755,[:uarch]),
      dir(my_os,"/etc/ssh",0,0,755,[:uarch]),
      # original version
      # vagrant version
      dir(my_os,"/usr",0,0,755,[:uarch]),
      dir(my_os,"/usr/local",0,0,755,[:uarch]),
      dir(my_os,"/usr/local/etc",0,0,755,[:uarch]),
      dir(my_os,"/usr/sbin",0,0,755,[:uarch]),
      file(my_os,"/usr/sbin/sshd",0,0,555,[:uarch],297792,"819b1edb37352186f3fdac8fb61010d4008cf93b7093cea6063615c785bfd1ae"),
      want(installed(my_os)),
    ]
  end

  defp load_latest(sc) do
     sc |> SymConfig.assert!(latest(os(:freebsd,@latest)))
  end
end

