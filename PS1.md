# Inverted enter” style arrow pointing right** (like `↪` or `⮕`) as your shell prompt symbol

Here’s how:

---

## 🧩 1. **Linux / WSL (Bash)**

Edit your Bash config:

```bash
nano ~/.bashrc
```

Add this line at the bottom:

```bash
# Fancy multi-color prompt with bold username and colored arrow
PS1="\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\n\[\e[1;33m\]↪ \[\e[0m\]"
"
```

Or a bolder arrow:

```bash
# Fancy multi-color prompt with bold username and colored arrow
PS1="\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\n\[\e[1;33m\]⮕ \[\e[0m\]"

```

* `\u` → username
* `\h` → hostname
* `\w` → working directory
* `\n` → newline, so the arrow appears on its own line
* `↪` or `⮕` → your custom right-pointing arrow
* `\[\e[32m\]` → green color for prompt
* `\[\e[0m\]` → reset color

Apply changes:

```bash
source ~/.bashrc
```

You’ll see:

```
deepak@ubuntu:~/projects
↪ 
```

---

## 🧩 2. **Windows PowerShell**

Open your profile:

```powershell
notepad $PROFILE
```

Add:

```powershell
function prompt {
    Write-Host ("PS " + (Get-Location)) -ForegroundColor Cyan
    return "↪ "
}
```

Reload:

```powershell
. $PROFILE
```

Your prompt now looks like:

```
PS C:\Users\Deepak\Projects
↪ 
```

---

💡 **Tip:**
Other right-pointing arrow symbols you can try:

* `→` (simple right arrow)
* `↦` (maps to)
* `⮕` (thicker arrow, enter-style)

---

If you want, I can give you a **ready-to-use PowerShell / WSL prompt** with **colors and this right-pointing arrow** exactly like Linux terminals used by devs. It will look very clean and professional. Do you want me to do that?
