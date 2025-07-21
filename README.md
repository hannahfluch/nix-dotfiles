# nix

## Running in a VM
```bash
nix run -L 'path:.#nixosConfigurations.chicken.config.system.build.vmWithDisko'
```

## TODO
- libdebug, potentially nix-ld
- fish: persist variables
- disko: more swap
- fix network miner
- `file`
