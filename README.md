# nix

## Running in a VM
```bash
rm chicken.qcow2
nix run -L 'path:.#nixosConfigurations.chicken.config.system.build.vm'
```
