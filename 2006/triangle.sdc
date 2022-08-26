# operating conditions and boundary conditions #

current_design triangle

set cycle 10;		#clock period defined by designer
set t_in  4;		#input delay defined by designer
set t_out 1;		#output delay defined by designer

create_clock -period $cycle [get_ports clk]
set_dont_touch_network [get_clocks clk]
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_latency 0.5 [get_clocks clk]

set_input_delay $t_in -clock clk [get_ports xi[*]]
set_input_delay $t_in -clock clk [get_ports yi[*]]
set_input_delay $t_in -clock clk [get_ports reset]
set_input_delay $t_in -clock clk [get_ports nt]
set_output_delay $t_out -clock clk [get_ports xo[*]]
set_output_delay $t_out -clock clk [get_ports yo[*]]
set_output_delay $t_out -clock clk [get_ports busy]
set_output_delay $t_out -clock clk [get_ports po]
 
set_load -pin_load 1 [get_ports xo[*]]    
set_load -pin_load 1 [get_ports yo[*]]    
set_load -pin_load 1 [get_ports po]    
set_load -pin_load 1 [get_ports busy]    

set_drive 1 [get_ports xi[*]]
set_drive 1 [get_ports yi[*]]
set_drive 1 [get_ports reset]
set_drive 1 [get_ports nt]
set_drive 1 [get_ports clk]
                       
set_operating_conditions -min_library fast -min fast  -max_library slow -max slow
set_wire_load_model -name tsmc18_wl10 -library slow 
                        

