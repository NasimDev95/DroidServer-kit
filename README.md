<p align="center">
  <img src="logo.png" alt="DroidServer-Kit Logo" width="100%">
</p>

# 🔥 DroidServer-Kit 

<p align="center">
  <img src="https://img.shields.io/badge/Termux-Environment-black?style=for-the-badge&logo=termux" alt="Termux">
  <img src="https://img.shields.io/badge/Script-Bash-green?style=for-the-badge&logo=gnu-bash" alt="Bash">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License MIT">
</p>

**DroidServer-Kit** is an automated, all-in-one full-stack development environment setup script for Android via Termux. It transforms your mobile device into a powerful local server and coding workspace with a single installation menu.

Developed by **Nasim Akhtab**.

---

## 🚀 Features

With a simple interactive CLI menu, you can install:
*   **Core System:** Essential packages (`git`, `curl`, `wget`, `nano`, `tar`).
*   **Programming Languages:** Node.js, Python, npm, yarn, and nodemon.
*   **XAMPP Alternative Stack:** Apache2, MariaDB (MySQL), and PHP for local hosting.
*   **VS Code Server:** Run a fully functional VS Code directly in your mobile browser.
*   **Ubuntu CLI:** A complete Ubuntu Linux environment (via `proot-distro`).
*   **Global Server Manager:** A custom `droidserver` command to easily start, stop, and manage all your background services.

---

## ⚠️ Prerequisites

1.  **Termux App:** Download the latest version of Termux from [F-Droid](https://f-droid.org/packages/com.termux/) (Do NOT use the Play Store version as it is outdated).
2.  **Storage:** Ensure you have at least **3 GB of free internal storage**.
3.  **Permissions:** Allow storage permissions when prompted during installation.

---

## 🛠️ Installation

You can install the entire toolkit using a single command. Open Termux, copy the command below, and paste it:

```bash
curl -sLO https://raw.githubusercontent.com/NasimDev95/DroidServer-kit/main/setup.sh && bash setup.sh
```
### How to use the Setup Menu:
Once the script runs, you will see an interactive menu:
 * Type 1 to 5 to install individual components.
 * Type 6 to **Install Everything** (Recommended). This will fully set up your environment and automatically activate the global droidserver command.
 * Type 0 to exit.
## ⚙️ Usage & Server Management
If you selected **Option [6] (Install Everything)**, the droidserver global command is automatically added to your system. You can use it from anywhere in Termux to manage your background processes!
### Server Commands:
```bash
droidserver start    # Starts Apache, MariaDB, and VS Code Server in the background
droidserver stop     # Safely stops all running services
droidserver restart  # Restarts all services instantly
droidserver status   # Displays the current status of your servers

```
### Accessing Your Tools:
 * **VS Code Server:** Run droidserver start, then open your mobile browser and go to http://127.0.0.1:8080.
 * **Local Web Server (Apache):** Place your web files in the Apache root folder and visit http://127.0.0.1:8080.
 * **Database (MariaDB):** Run mariadb or mysql in Termux to access the database CLI.
 * **Ubuntu CLI:** Type proot-distro login ubuntu to enter the Linux environment. Type exit to leave.
## 🤝 Contribution
Contributions, issues, and feature requests are welcome!
 1. Fork the Project
 2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
 3. Commit your Changes (git commit -m 'Add some AmazingFeature')
 4. Push to the Branch (git push origin feature/AmazingFeature)
 5. Open a Pull Request
## 📄 License
This project is licensed under the **MIT License**. You are free to use, modify, and distribute this software as long as the original copyright and license notice are included.
