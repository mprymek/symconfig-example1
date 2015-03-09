defmodule Repo do
  @moduledoc """
  This module simulates facts generated from package repostory.
  """
  import SymConfig.Spec

  def load(sc) do
    nginx = pkg("nginx","1.6.2_1,2")
    sc |> SymConfig.assert!([
      # latest version of packages are...
      latest(nginx),

      # packages files are...
      dir(nginx,"/usr/local/etc/nginx",0,0,755,[:uarch]),
      file(nginx,"/usr/local/etc/nginx/nginx.conf-dist",0,0,644,[:uarch],2693,"6418ea5b53e0c2b4e9baa517fce7ccf7619db03af68de7445dccb2c857978a4a"),
      file(nginx,"/usr/local/www/nginx/index.html",0,0,644,[:uarch],612,"38ffd4972ae513a0c79a8be4573403edcd709f0f572105362b08ff50cf6de521"),

      # package dependencies are...
      pkg_dep(nginx, pkg("expat","2.1.0_2")),
      pkg_dep(nginx, pkg("openldap-sasl-client","2.4.40_1")),
      pkg_dep(nginx, pkg("pcre","8.35_2")),
      pkg_dep(pkg("openldap-sasl-client","2.4.40_1"), pkg("cyrus-sasl","2.1.26_9")),
    ])
  end
end

