import libcalamares
import subprocess

def run():
    config = libcalamares.job.configuration
    install_nvidia = config.get("installNvidia", False)

    if install_nvidia:
        root_mount = libcalamares.globalstorage.value("rootMountPoint")
        try:
            subprocess.run(
                ["chroot", root_mount, "apt", "update"],
                check=True
            )
            subprocess.run(
                ["chroot", root_mount, "apt", "install", "-y", "nvidia-driver"],
                check=True
            )
        except subprocess.CalledProcessError as e:
            return ("Fehler bei der Installation des NVIDIA-Treibers: {}".format(e),)
    return None