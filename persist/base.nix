{ lib, ... }:
rec {
  persistentOption =
    with lib;
    with lib.types;
    mkOption {
      description = "persistent file or directory";
      type = attrsOf (submodule {
        options = {
          prefix = mkOption {
            default = "/persistent/";
            type = strMatching "^/([[:alnum:]_]+/)?$";
          };
          contents = mkOption {
            default = [ ];
            type = listOf (
              coercedTo str
                (
                  s:
                  if isDirectory s then
                    {
                      directory = stripTrailing s;
                      file = null;
                    }
                  else
                    {
                      file = s;
                      directory = null;
                    }
                )
                (submodule {
                  options = {
                    directory = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Path to directory.";
                    };
                    mode = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Permissions mode for directory (e.g., 0700). Does not apply to file.";
                    };
                    group = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Group of directory (e.g., root). Does not apply to file.";
                    };
                    user = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Owner of directory (e.g., root). Does not apply to file.";
                    };
                    file = mkOption {
                      type = nullOr str;
                      default = null;
                      description = "Path to file.";
                    };
                  };
                })
            );
          };
        };
      });
    };

  getPath = p: if p.directory != null then p.directory else p.file;
  isDirectory =
    p: if builtins.isString p then lib.hasSuffix "/" p else (p ? directory && p.directory != null);
  isSystem = p: lib.hasPrefix "/" (getPath p);

  not = f: a: !(f a);
  stripTrailing = p: lib.substring 0 (builtins.stringLength p - 1) p;
  filter2 =
    f: g: c:
    builtins.filter f (builtins.filter g c);

  transformFile = map (e: {
    file = e.file;
  });

  transformDir = map (
    e:

    {
      directory = e.directory;
    }
    // (lib.optionalAttrs (e.mode != null) { mode = e.mode; })
    // (lib.optionalAttrs (e.user != null) { user = e.user; })
    // (lib.optionalAttrs (e.group != null) { group = e.group; })
  );

  parseUserDirectories = paths: transformDir (filter2 (not isSystem) isDirectory paths);
  parseUserFiles = paths: transformFile (filter2 (not isSystem) (not isDirectory) paths);

  parseSystemDirectories = paths: transformDir (filter2 isSystem isDirectory paths);
  parseSystemFiles = paths: transformFile (filter2 isSystem (not isDirectory) paths);

  dirsAndFiles = system: contents: {
    directories = (if system then parseSystemDirectories else parseUserDirectories) contents;
    files = (if system then parseSystemFiles else parseUserFiles) contents;
  };

}
