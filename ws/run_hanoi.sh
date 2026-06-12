#!/bin/bash
# 確保每次執行前都沒有殘留的舊行程
echo "=== 正在清理舊的殘留行程... ==="
pkill -9 -f "hanoi_planner" || true
pkill -9 -f "hanoi_vision" || true
pkill -9 -f "voicegpt_node" || true
pkill -9 -f "hanoi_coordinator" || true
pkill -9 -f "move_group" || true
pkill -9 -f "rviz2" || true
pkill -9 -f "controller_manager" || true
pkill -9 -f "usb_cam_node_exe" || true
sleep 1

echo "=== 正在啟動河內塔模擬環境 ==="
source /opt/ros/humble/setup.bash
source install/setup.bash
ros2 launch myrobot hanoi_sim.launch.py
