# DotFiles

```
                                _
 _ __ ___   __ _ _ __  ____  __| | _____   __
| '_ ` _ \ / _` | '_ \|_  / / _` |/ _ \ \ / /
| | | | | | (_| | | | |/ / | (_| |  __/\ V /
|_| |_| |_|\__,_|_| |_/___(_)__,_|\___| \_/
```

Configuración personal de entorno para Linux.

## Instalación

```bash
git clone https://github.com/manz/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

> **Nota:** Ejecutar como usuario regular, no con sudo.

## Features

| Categoría | Paquetes |
|-|-|
| **Shell** | fish, fisher, tide |
| **Terminal** | tmux, htop, ncdu, less, man, ccze |
| **Editores** | vim, nano, micro |
| **Git** | git, gh |
| **Red/Utils** | curl, xh, wget, jq |
| **Multimedia** | imagemagick, ffmpeg |

### Herramientas modernas

| Herramienta | Descripción |
|-|-|
| **eza** | `ls` moderno con icons |
| **bat** | `cat` con syntax highlighting |
| **zoxide** | `cd` inteligente |
| **fzf** | Fuzzy finder |
| **duf** | `df` moderno |
| **xh** | HTTP client como httpie |
| **glow** | Markdown en terminal |
| **catimg** | Ver imágenes en terminal |
| **micro** | Editor de terminal |
| **cht.sh** | Cheat sheets |
| **lolcat** | Rainbow output |

### Lenguajes y runtimes

| Tecnología | Versión/Manager |
|-|-|
| **Node.js** | LTS via pnpm |
| **Deno** | LTS via pnpm |
| **pnpm** | Package manager |
| **Rust** | via rustup |
| **Go** | 1.22.5 |
| **Python** | 3.12 via uv |

### Herramientas Rust

- `choose` - alternativa a cut
- `jless` - JSON viewer

### Paquetes Node globales

- `svgo` - Optimizador SVG
- `wipeclean` - Limpiar node_modules
- `ttf2woff` - Convertir fuentes
- `servor` - Servidor dev

### Fish Shell

- **Fisher** - Plugin manager
- **Tide** - Prompt moderno
- **Alias:**
  - `ls` → `eza --icons`
  - `cat` → `batcat`
  - `tree` → `eza --icons --tree -L 1 -I node_modules`
- **zoxide** integrado

## Estructura

```
dotfiles/
├── install.sh      # Script de instalación
└── README.md       # Este archivo
```

## Licencia

MIT

---

📚 [Más sobre configurar tu terminal](https://terminaldelinux.com/terminal)
