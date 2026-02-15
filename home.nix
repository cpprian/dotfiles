{ config, pkgs, ... }:

{
  home.username = "cyprian";
  home.homeDirectory = "/home/cyprian";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # Terminal & Shell
    starship
    zellij
    
    # Dev tools
    lazygit
    xh
    btop
    atac
    
    # CLI utilities
    ripgrep
    fd
    bat
    yazi
    jless
    eza
    
    # SQL
    harlequin
    
    # Kubernetes
    k9s
    
    # Languages
    rustup
    go
    python3
    python3Packages.pip
    gcc
    cmake
    zig
    
    # Wayland specific
    wl-clipboard
    wdisplays
    wev
    wtype
    
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  programs.home-manager.enable = true;

  # HELIX - używamy programs.helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        mouse = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        lsp.display-inlay-hints = true;
      };
    };
  };

  # FOOT - używamy programs.foot
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=11";
        dpi-aware = "yes";
      };
      
      colors = {
        alpha = 0.95;
        foreground = "cdd6f4";
        background = "1e1e2e";
        
        regular0 = "45475a";
        regular1 = "f38ba8";
        regular2 = "a6e3a1";
        regular3 = "f9e2af";
        regular4 = "89b4fa";
        regular5 = "f5c2e7";
        regular6 = "94e2d5";
        regular7 = "bac2de";
        
        bright0 = "585b70";
        bright1 = "f38ba8";
        bright2 = "a6e3a1";
        bright3 = "f9e2af";
        bright4 = "89b4fa";
        bright5 = "f5c2e7";
        bright6 = "94e2d5";
        bright7 = "a6adc8";
      };
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      ls = "eza -l";
      lg = "lazygit";
      clip = "wl-copy";
      paste = "wl-paste";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cpprian";
        email = "cpprian456@proton.me";
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
    };
  };
  
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
  
  # Symlinks only for programs that do not have programs.*
  home.file = {
    ".config/sway/config".source = ./configs/sway/config;
    
    # Waybar
    ".config/waybar/config.jsonc".source = ./configs/waybar/config.jsonc;
    ".config/waybar/style.css".source = ./configs/waybar/style.css;
    
    # Wofi
    ".config/wofi/config".source = ./configs/wofi/config;
    ".config/wofi/style.css".source = ./configs/wofi/style.css;
    
    # Mako
    ".config/mako/config".source = ./configs/mako/config;
    
    # Starship
    ".config/starship.toml".source = ./configs/starship/starship.toml;
    
    # Zellij
    ".config/zellij/config.kdl".source = ./configs/zellij/config.kdl;
    
    # Yazi
    ".config/yazi/yazi.toml".source = ./configs/yazi/yazi.toml;
  };

  # Wayland environment variables
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";
  };
}
