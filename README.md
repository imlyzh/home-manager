
## first install nix home-manager

## use in home-manager(linux)
```sh
home-manager switch --flake .#linux
```

<!-- ## use in home-manager(mac)
```sh
home-manager switch --flake .#mac
``` -->

## remote push and build

```sh
nix run .#deploy .#lyzh-nixos-laptop -- --remote-build
```