---
layout: single
title: "E4S Remote Desktop"
permalink: /guacamole/
classes: wide
sidebar:
  nav: "getmenu"
---

{% include e4s-page-actions.html %}

# E4S remote desktop quickstart

E4S full-release container images include a browser-accessible Linux desktop powered by Apache Guacamole and VNC. This is useful for running graphical applications from an E4S container without installing a desktop client on your local system.

> **Availability:** The remote desktop is available with **E4S 26.11 and later** and is included only in the **full release images**. It is not included in minimal images.

## Start the container

### Docker

Docker must use host networking so the services started in the container are reachable through the SSH tunnel described below.

```bash
$> docker run --network host --rm -it <full-e4s-image>
```

Add any other Docker options you normally need, such as GPU access or bind mounts. For example:

```bash
$> docker run --network host --gpus all -v "$HOME:$HOME" --rm -it <full-e4s-image>
```

> **Docker requirement:** `--network host` is necessary. Without it, the Guacamole web service and VNC session will not be available through the connection instructions printed by the launcher.

### Apptainer or Singularity

Enter the full E4S image as usual. For example:

```bash
$> apptainer shell <full-e4s-image>.sif
```

or:

```bash
$> singularity shell <full-e4s-image>.sif
```

## Launch the desktop

From inside the container, run:

```bash
$> guacamole
```

On the first run, the launcher asks you to configure:

1. The VNC port. In most cases, accept the suggested port.
2. A Guacamole web username and password. You will need these to log in to the Guacamole session in your browser.
3. A VNC password. This is separate from your Linux or institutional password. Use a dedicated password, or if you only intend use the VNC session with Guacamole press Enter when offered the option to generate one.

The launcher then starts the VNC desktop, Guacamole, and its local web service. At the end of startup it prints an SSH tunnel command and a local browser URL. Keep the container and the `guacamole` command running while using the desktop.

## Connect from your local computer

Run the printed SSH command in a terminal on your **local computer**. It will resemble:

```bash
$> ssh -N -L <port>:127.0.0.1:<port> <user>@<remote-host>
```

If you are running the container on a system that requires access via a login node you can add ssh jump to tunnel from the login node to the host:

```bash
$> ssh -J <user>@<login-node> -N -L <port>:127.0.0.1:<port> <user>@<remote-host>
```

Leave that SSH command running. Then open the URL printed by `guacamole` in a browser on your local computer. It will resemble:

```text
http://127.0.0.1:<port>/guacamole
```

Sign in with the Guacamole web username and password you selected during first-time setup.

> The Guacamole web service listens only on the remote system's loopback interface. The SSH tunnel makes it available to your local browser without exposing the service directly to the network.


## Copy and paste with the Guacamole side panel

To open the Guacamole side panel while viewing the remote desktop, press:

- **Windows or Linux:** `Ctrl` + `Alt` + `Shift`
- **macOS:** `Control` + `Option` + `Shift`

Press the same key combination again to close the panel.

To paste text **into** the E4S desktop:

1. Open the Guacamole side panel.
2. Copy the text on your local computer.
3. Click the **Clipboard** text area and paste the text into it.
4. Close the side panel.
5. Paste normally into the remote terminal or application.

Text placed in the side panel's **Clipboard** area is transferred to the remote desktop clipboard. Guacamole initially hides the clipboard contents for privacy; click the Clipboard area to view or edit them.

Copying text **out of** the E4S desktop normally works directly: select and copy the text in the remote application, then paste it into an application on your local computer. The side panel is generally needed only when pasting local text into the container.


## End the session

Log out of the graphical desktop if desired, then return to the terminal running `guacamole` and press **Ctrl+C**. The launcher stops the services and VNC session that it started.

## Display size

By default, the remote desktop uses a fixed **1920x1200** resolution. Guacamole scales that desktop for the browser window, avoiding extremely large remote desktops on high-resolution monitors.

To let Guacamole dynamically resize the remote desktop to match the browser viewport, start it with:

```bash
$> guacamole --dynamic-resize
```

Dynamic resizing depends on support from the VNC server in the image.

To choose a different fixed resolution, set `VNC_GEOMETRY` when launching Guacamole:

```bash
$> VNC_GEOMETRY=1600x900 guacamole
```

## Useful runtime options

The normal quickstart requires only `guacamole`. These settings are available for less common situations:

| Setting | Purpose |
|---|---|
| `guacamole --dynamic-resize` | Allow Guacamole to request desktop resizing as the browser viewport changes. |
| `VNC_GEOMETRY=WIDTHxHEIGHT guacamole` | Select the initial fixed desktop resolution. The default is `1920x1200`. |
| `SSH_HOST=<hostname> guacamole` | Override the hostname shown in the printed SSH tunnel command. |
| `SSH_USER=<username> guacamole` | Override the SSH username shown in the printed tunnel command. |
| `SSH_OPTS="<options>" guacamole` | Add SSH options to the printed command, such as `-J bastion.example.org`. |
| `guacamole --help` | Display the launcher help and available environment variables. |

## Common issues

### The browser cannot connect

Confirm that:

- the container and `guacamole` command are still running;
- the SSH tunnel is running on your local computer;
- you opened the exact local URL printed by the launcher; and
- Docker was started with `--network host`.

### The printed SSH hostname is not the one you use

Restart the launcher with the hostname you normally use for SSH:

```bash
$> SSH_HOST=login.example.org guacamole
```

If access requires a jump host, include it in the printed command with `SSH_OPTS`:

```bash
$> SSH_HOST=compute.example.org SSH_OPTS="-J bastion.example.org" guacamole
```

### The desktop is too small or too large

The default fixed resolution is intended to work well across typical displays. Select another fixed size with `VNC_GEOMETRY`, or opt into browser-driven sizing with `--dynamic-resize`.

