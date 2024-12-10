
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Boot
  boot = {
    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    }

  };

  # Nix
  nix = {
    # Settings
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Networking
  networking = {
    hostName = "lucille";
    networkmanager = {
      enable = true;
    };
  };

  # Time
  time = {
    timeZone = "Asia/Jakarta";
  };

  # i18n
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Services
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
      };

      desktopManager = {
        gnome.enable = true;
      };

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing = {
      enable = true;
    };

    mysql = {
       enable = true;
       package = pkgs.mariadb;
       dataDir = "/var/lib/mysql";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

    };

    openssh = {
      enable = true;
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };
  
  # Hardware
  hardware = {
    pulseaudio.enable = false;
  };

  # Security
  security = {
    rtkit = {
      enable = true;
    };
  };

  # Users
  users = {
    users = {
      
      fynn = {
        isNormalUser = true;
        description = "Nurfian Qodar";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        packages = with pkgs; [
          #  thunderbird
        ];
      };
    };
  };

  # Programs
  programs = {
    firefox = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "nurfianqodar";
      userEmail = "77nurfianqodar@gmail.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      aliases = {
        "grap" = "log --oneline --graph --all --oneline";
      };
    };
  };

  # Nixpkgs
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Environment
  environment = {
    systemPackages = with pkgs; [
      # A
      aircrack-ng
      autodock-vina
      # B
      # C
      cmake
      # D
      sqlitebrowser
      direnv
      discord
      docker
      # E
      extra-cmake-modules
      # F
      # G
      gcc
      gh
      git
      glibc
      gnome-tweaks
      gnumake
      go
      google-chrome
      gparted
      gromacs
      # H
      # I
      # J
      # K
      # L
      libcxx
      libgcc
      libreoffice
      # M
      mariadb
      # N
      neofetch
      neovim
      # P
      pipenv
      poetry
      postgresql
      postman
      pymol
      python3
      # R
      R
      rustup
      # S
      spotify
      stdenv.cc.cc.lib
      # T
      tor
      tor-browser
      tshark
      # V
      vlc
      vscode
      # W
      wget
      wireshark
    ];
  };

  system = {
    stateVersion = "24.11";
  };
}
