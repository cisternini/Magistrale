radix define fsm_state { 
"2'b00" "S0", 
"2'b01" "S1", 
"2'b10" "S2", 
"2'b11" "S3", 
-default binary 
} 

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fsm/clk
add wave -noupdate /fsm/rst_n
add wave -noupdate /fsm/en
add wave -noupdate -radix fsm_state /fsm/current_state
add wave -noupdate -radix unsigned /fsm/out_code
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {159 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {163 ps}
