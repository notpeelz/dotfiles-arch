# vim:ft=zsh foldmethod=marker

clear

if
  [[ -z "${WAYLAND_DISPLAY:-}" && "${XDG_VTNR:-}" -eq 1 ]] \
    && fgconsole &>/dev/null \
    && uwsm check may-start
then
  start-compositor() {
    export NIRI_DISABLE_SYSTEM_MANAGER_NOTIFY=1
    systemd-cat -t uwsm-start uwsm start -- /usr/bin/niri --session
    exitcode="$?"
    if [[ "${exitcode}" -eq 0 ]]; then
      clear
    fi
  }

  start-compositor
fi
