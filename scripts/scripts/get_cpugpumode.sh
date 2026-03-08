#!/bin/bash
# @vicinae.schemaVersion 1
# @vicinae.title get gpu/cpu stats
# @vicinae.mode fullOutput
echo printing gpu_performance_mode:
cat /sys/class/drm/card1/device/power_dpm_force_performance_level
echo
echo printing cpu_governor:
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo
echo printing rocm-smi output:
rocm-smi
echo
