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
- fix uv
- add python to prompt


## For next Release
- material-symbols (stable)
- quickshell (hm)
- networkminer (stable)
- rclone hm should work! (https://github.com/nix-community/home-manager/issues/7577)
