defmodule Nginx do
  import SymConfig.Spec

  def load(sc) do
    my_cfg = cfg_file "/usr/local/etc/nginx/nginx.conf"
    my_svc = svc_running "nginx"
    my_pkg = pkg_installed "nginx"

    sc |> SymConfig.assert!([
      peex("/usr/local/etc/nginx/nginx.conf-dist","/usr/local/etc/nginx/nginx.conf","patch-nginx.conf",:nginx),
      depends(my_svc,my_pkg),
      depends(my_svc,my_cfg),
      depends(my_cfg,my_pkg),
      want(my_svc),

      # index.html
      peex("/usr/local/www/nginx/index.html","/usr/local/www/nginx/index.html","patch-index.html",nil),
      depends(my_svc,cfg_file("/usr/local/www/nginx/index.html")),
      depends(cfg_file("/usr/local/www/nginx/index.html"),my_pkg),
    ])
  end
end
