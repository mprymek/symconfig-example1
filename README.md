# SymConfig Example 1

Example specification for SymConfig (https://github.com/mprymek/symconfig)

The provisioned machine should:
 * run sshd on ports 22, 3333 and 3334
 * run nginx on port 80 (tunelled to localhost:8080 by VirtualBox)
 * serve modified www title page

The specification itself is in the file [lib/spec.ex](lib/spec.ex). Other files ([lib/freebsd.ex](lib/freebsd.ex), [lib/nginx.ex](lib/nginx.ex)...)
are reusable components.

## Prerequisites
 * Elixir (https://github.com/elixir-lang/elixir)
 * Vagrant
 * VirtualBox
 * patience to wait for Vagrant to download FreeBSD 10.1 image (cca 430MB)

## Install and Compile
```
$ git clone https://github.com/mprymek/symconfig-example1.git
$ cd symconfig-example1
$ mix do deps.get, compile
```

## Provisioning Itself
Start virtual machine and provision it
```
$ (cd test/fixtures/vagrant; vagrant up)
$ mix sc.provision
```
If everything went well, you can now point your browser to http://localhost:8080 and you should
see a welcome message "Welcome to SymConfig-provisioned nginx!"

## Cleanup

You can destroy the virtual machine with:
```
$ (cd test/fixtures/vagrant; vagrant destroy -f)
```
