# 🛠️ Roblox Pro Development Workflow Setup

Want to build Roblox games like the top studios? Follow this step-by-step guide to set up a **professional development environment** using:

- **VS Code**
- **Rojo**
- **Wally**
- **Git & GitHub**
- **Selene** (Linter)
- **Stylua** (Formatter)

---

## Tools You'll Be Using

| Tool | Purpose |
|------|---------|
| [VS Code](https://code.visualstudio.com/) | Code editor |
| [Rokit](https://github.com/rojo-rbx/rokit) | Toolchain manager |
| [Rojo](https://rojo.space/) | Sync VS Code with Roblox Studio |
| [Wally](https://wally.run/) | Package manager |
| [Git](https://git-scm.com/) & [GitHub](https://github.com/) | Version control |
| [Selene](https://kampfkarren.github.io/selene/) | Linter |
| [Stylua](https://github.com/JohnnyMorganz/StyLua) | Formatter |

---

## Step-by-Step Setup

### Step 1: Install VS Code
Download and install [Visual Studio Code](https://code.visualstudio.com/). Save a shortcut to your desktop if you'd like.

---

### Step 2: Install Rokit
Download the latest [Rokit release](https://github.com/rojo-rbx/rokit) from GitHub.

- Extract the `.zip`
- Run the `.exe` file
- If prompted as "unrecognized app," allow it anyway
- Restart your computer after installation

---

### Step 3: Create Your Roblox Projects Folder

- Create a main folder, e.g., `RobloxProjects`
- Inside it, make a game folder (e.g., `MyGame`)

---

### Step 4: Open the Game Folder in VS Code

---

### Step 5: Install VS Code Extensions

Install these extensions from the Extensions tab:

1. `Luau Language Server`
2. `Rojo`

---

### Step 6: Initialize Project with Rokit

Open the terminal in VS Code (`Ctrl + ~`), then run:

```bash
rokit init
rokit add rojo
rojo init
````

---

### Step 7: Clean Up Rojo Project JSON

* Open `default.project.json`
* Remove everything under `workspace` unless you plan on syncing instances
* Use the `src/` folder for all your code

File types:

* `*.server.luau` → Server script
* `*.client.luau` → Client script
* `*.luau` → Module script

---

### Step 8: Install Rojo Plugin in Studio

* Press `Ctrl + Shift + P`, search `Rojo`, click "Open Rojo Menu"
* Install the **Rojo Plugin** in Roblox Studio
* Restart Studio if open
* Click the green arrow to start syncing
* Connect to the project from the Rojo plugin in Studio

---

### Step 9: Add Linter and Formatter

#### Install:

* [Selene](https://kampfkarren.github.io/selene/)
* [Stylua](https://github.com/JohnnyMorganz/StyLua)

#### Create a `selene.toml` file:

```toml
std = "roblox"

[lints]
unused_variable = "allow"
roblox_incorrect_roact_usage = "allow"
```

#### Update `settings.json` in VS Code:

Press `Ctrl + Shift + P` → `Preferences: Open Settings (JSON)`
Paste:

```json
"[lua]": {
  "editor.defaultFormatter": "JohnnyMorganz.stylua",
  "editor.formatOnSave": true
},
"[luau]": {
  "editor.defaultFormatter": "JohnnyMorganz.stylua",
  "editor.formatOnSave": true
},
"workbench.editor.customLabels.patterns": {
  "**/init.lua": "${dirname} (${filename}.${extname})",
  "**/init.luau": "${dirname} (${filename}.${extname})"
}
```

#### Enable Auto Imports

Go to the **Luau Language Server** extension settings and enable **auto imports** under the *"imports"* section.

---

### Step 10: Set Up Wally (Package Manager)

```bash
rokit add wally
rokit add wally-package-types
wally init
```

#### Add Dependencies

Go to [wally.run](https://wally.run/), find your package, click "Install", and copy the path.

Paste into `wally.toml` under `[dependencies]`.
Example:

```toml
[dependencies]
Promise = "evaera/promise@4.0.0"
```

If server-only:

```toml
[server-dependencies]
ProfileService = "surnautica/profileservice@1.0.0"
```

#### Install Packages

```bash
wally install
```

#### Update `default.project.json` to include:

```json
{
  "replicatedStorage": {
    "packages": "Packages"
  },
  "serverScriptService": {
    "serverPackages": "ServerPackages"
  }
}
```

#### Generate Type Definitions (Optional)

```bash
wally-package-types -s sourcemap.json Packages/
```

---

### Step 11: Initialize Git & GitHub

#### Install Git

Download from [git-scm.com](https://git-scm.com/)

#### Configure Git (Terminal):

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

#### Initialize Repository

* Open Source Control tab
* Click `Initialize Repository`

#### Create `.gitignore` and ignore:

```gitignore
# Wally and Rojo generated files
Packages/
ServerPackages/
sourcemap.json
wally.lock
```

---

### Step 12: Make Your First Commit

* Write a message
* Click Commit

---

### Step 13: Publish to GitHub

* Click "Publish to GitHub" in VS Code
* Follow the prompts

---

### Step 14: Use Branches for Features

* Create branches for new features (e.g., `feature/tank`)
* Merge them via GitHub Pull Requests
* Pull changes locally after merging

---

## Best Practices

* Use Git branches to isolate features
* Commit often with clear messages
* Pull before starting work
* Use auto formatting and linting to keep your code clean
* Reuse packages across projects with Wally

---

## Additional Resources

* [Stylua Docs](https://github.com/JohnnyMorganz/StyLua)
* [Selene Docs](https://kampfkarren.github.io/selene/)
* [Rojo Docs](https://rojo.space/)
* [Wally Packages](https://wally.run/)
* [Git Basics](https://www.atlassian.com/git/tutorials/what-is-git)

---

### If this helped, consider ⭐ starring the repo and sharing with other Roblox devs!
