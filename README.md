# nix

My NixOS configuration and quickshell-setup.

## Running in a VM
```bash
nix run -L 'path:.#nixosConfigurations.chicken.config.system.build.vmWithDisko'
```

## TODO
- libdebug, potentially nix-ld
- fish: persist variables
- ~~fix network miner~~
- ~~`file`~~
- configure git PAT in config
- telegram
- ~~msfvenom~~
- backups


## For next Release
- material-symbols (stable)
- quickshell (hm)
- networkminer (stable)
