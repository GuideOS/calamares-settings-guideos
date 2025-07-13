import subprocess
import os
import re
import libcalamares


def detect_nvidia_gpu():
    try:
        output = subprocess.check_output(["lspci", "-nnk"], text=True)
        for line in output.splitlines():
            if re.search(r"(VGA|3D controller):.*NVIDIA", line, re.IGNORECASE):
                libcalamares.utils.debug("NVIDIA-GPU erkannt in Zeile: {}".format(line))
                return True
        return False
    except Exception as e:
        libcalamares.utils.debug("Fehler bei der GPU-Erkennung: {}".format(e))
        return False


def install_nvidia_driver():
    try:
        root_mount_point = libcalamares.globalstorage.value("rootMountPoint")
        libcalamares.utils.debug("Root-Mountpunkt: {}".format(root_mount_point))

        subprocess.run(["chroot", root_mount_point, "apt-get", "update"], check=True)
        subprocess.run(["chroot", root_mount_point, "apt-get", "install", "-y", "nvidia-driver"], check=True)

        # Nouveau-Treiber deaktivieren
        disable_nouveau_path = os.path.join(root_mount_point, "etc/modprobe.d/disable-nouveau.conf")
        with open(disable_nouveau_path, "w") as f:
            f.write("blacklist nouveau\noptions nouveau modeset=0\n")

        subprocess.run(["chroot", root_mount_point, "update-initramfs", "-u"], check=True)

        return None
    except subprocess.CalledProcessError as e:
        return "Fehler bei der NVIDIA-Treiberinstallation: {}".format(e)
    except Exception as e:
        return "Allgemeiner Fehler: {}".format(e)


def run():
    libcalamares.utils.debug("Starte NVIDIA-Treibererkennung...")
    if detect_nvidia_gpu():
        libcalamares.utils.debug("NVIDIA-GPU erkannt. Starte Treiberinstallation...")
        return install_nvidia_driver()
    else:
        libcalamares.utils.debug("Keine NVIDIA-GPU erkannt. Überspringe Installation.")
        return None
