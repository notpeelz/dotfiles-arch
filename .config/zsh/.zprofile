# vim:ft=zsh foldmethod=marker

if
  [[ -z "${WAYLAND_DISPLAY:-}" && "${XDG_VTNR:-}" -eq 1 ]] \
    && fgconsole &>/dev/null \
    && uwsm check may-start
then
  clear
  export NIRI_DISABLE_SYSTEM_MANAGER_NOTIFY=1
  systemd-cat -t uwsm-start uwsm start -- /usr/bin/niri --session
  uwsm stop -r niri
  exit 0
fi
