export DISPLAY=:0
export PATH="/opt/microsoft/intune/bin:$PATH"
export PULSE_SERVER=unix:/run/host_pulse_native
systemctl --user import-environment DISPLAY PATH PULSE_SERVER
