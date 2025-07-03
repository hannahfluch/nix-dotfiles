set -e
nix build path:.#nixosConfiguration.hatcher.config.system.build.isoImage
echo "qemu-system-x86_64 -enable-kvm -m 256 -cdrom result/iso/nixos-*.iso" | nix shell nixpkgs#qemu
