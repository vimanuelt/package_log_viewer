# Package Log Viewer

**Package Log Viewer** is a lightweight desktop application developed in OCaml using GTK3. It provides an intuitive interface to view and analyze logs of installed packages and ports on FreeBSD-based systems.

## Features

- **Installed Packages Tab**: Displays logs for installed packages (`pkg`).
- **Installed Ports Tab**: Displays logs for installed ports (`pkg-static`).
- **Sorted by Time**: Logs are organized with the newest entries displayed at the top for quick insights.
- **Tabbed Interface**: Easy-to-navigate tabs for streamlined log viewing.
- **Scrollable Views**: Integrated scroll bars for convenient navigation through log entries.

## Requirements

- **Operating System**: FreeBSD or GhostBSD
- **OCaml Version**: 4.14.0 or compatible
- **Dependencies**:
  - `lablgtk3`
  - `str`
  - GTK3 runtime environment

## Installation

### 1. Install Dependencies

Ensure you have `opam` installed, then run:

```bash
opam install lablgtk3 str
```

### 2. Clone the Repository

```bash
git clone https://github.com/vimanuelt/package_log_viewer.git
cd package_log_viewer
```

### 3. Compile the Application

```bash
ocamlfind ocamlc -thread -package lablgtk3,str -linkpkg -o plv plv.ml
```

### 4. Run the Application

```bash
./plv
```

## Usage

1. Launch the application.
2. View the **Installed Packages** tab for logs related to installed packages (`pkg`).
3. Switch to the **Installed Ports** tab for logs related to installed ports (`pkg-static`).
4. Scroll through the logs for detailed information.

The logs are sorted with the newest entries displayed at the top to help you quickly find recent events.

## Screenshots

### Installed Packages Tab
![Installed Packages Tab](img/Installed-Packages.png)

### Installed Ports Tab
![Installed Ports Tab](img/Installed-Ports.png)

## Contributing

Contributions are welcome! Here's how you can help:

- **Report Bugs**: If you encounter any issues, please submit them via the issue tracker.
- **Suggest Enhancements**: Have ideas for new features or improvements? We'd love to hear from you.
- **Submit Pull Requests**: Feel free to fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

### Notes

- **Default Log Path**: The application reads logs from `/var/log/messages` by default. Update the path in the code if your logs are stored elsewhere.
- **Future Updates**: We're considering renaming the application. If you have creative suggestions, please share them! 😉
- **Compatibility**: Designed specifically for FreeBSD-based systems. Functionality may vary on other platforms.

