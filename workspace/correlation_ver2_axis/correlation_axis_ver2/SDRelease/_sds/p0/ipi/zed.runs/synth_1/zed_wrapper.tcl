# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7z020clg484-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.cache/wt [current_project]
set_property parent.project_path /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.0 [current_project]
set_property ip_repo_paths {
  /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/iprepo/repo
  /opt/Xilinx/SDSoC/2014.4/data/ip/xilinx
} [current_project]
add_files /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/zed.bd
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_ps7_0/zed_ps7_0.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_1_0/zed_proc_sys_reset_1_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_1_0/zed_proc_sys_reset_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_1_0/zed_proc_sys_reset_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_2_1/zed_proc_sys_reset_2_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_2_1/zed_proc_sys_reset_2_1.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_2_1/zed_proc_sys_reset_2_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_3_2/zed_proc_sys_reset_3_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_3_2/zed_proc_sys_reset_3_2.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_3_2/zed_proc_sys_reset_3_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_0_3/zed_proc_sys_reset_0_3_board.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_0_3/zed_proc_sys_reset_0_3.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_proc_sys_reset_0_3/zed_proc_sys_reset_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_datamover_0_0/zed_datamover_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_datamover_0_0/zed_datamover_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_datamover_0_0/zed_datamover_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_datamover_1_0/zed_datamover_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_datamover_1_0/zed_datamover_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_datamover_1_0/zed_datamover_1_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/ipshared/xilinx.com/correlation_accel_v2_v1_0/702cfb39/constraints/correlation_accel_v2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_correlation_accel_v2_0_if_0/zed_correlation_accel_v2_0_if_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_correlation_accel_v2_0_if_0/zed_correlation_accel_v2_0_if_0.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_correlation_accel_v2_0_if_0/zed_correlation_accel_v2_0_if_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_xbar_0/zed_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_xbar_1/zed_xbar_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_axis_dwc_datamover_0_txd_0_0/zed_axis_dwc_datamover_0_txd_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_axis_dwc_datamover_1_rxd_0_0/zed_axis_dwc_datamover_1_rxd_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_s00_regslice_0/zed_s00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_s00_data_fifo_0/zed_s00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_m00_regslice_0/zed_m00_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_m01_regslice_0/zed_m01_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_m02_regslice_0/zed_m02_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_s00_regslice_1/zed_s00_regslice_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_s00_data_fifo_1/zed_s00_data_fifo_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_s01_regslice_0/zed_s01_regslice_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_s01_data_fifo_0/zed_s01_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_m00_data_fifo_0/zed_m00_data_fifo_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_m00_regslice_1/zed_m00_regslice_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_auto_pc_0/zed_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/ip/zed_auto_pc_1/zed_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/zed_ooc.xdc]
set_property is_locked true [get_files /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/zed.bd]

read_verilog -library xil_defaultlib /home/trungnguyen/SDSoC/workspace/correlation_ver2_axis/correlation_axis_ver2/SDRelease/_sds/p0/ipi/zed.srcs/sources_1/bd/zed/hdl/zed_wrapper.v
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file zed_wrapper.hwdef }
synth_design -top zed_wrapper -part xc7z020clg484-1
write_checkpoint -noxdef zed_wrapper.dcp
catch { report_utilization -file zed_wrapper_utilization_synth.rpt -pb zed_wrapper_utilization_synth.pb }
