onerror {exit -code 1}
vlib work
vcom -work work CRC_8.vho
vcom -work work Waveform_v2.vwf.vht
vsim -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.encoder_CRC_8_v2_vhd_vec_tst
vcd file -direction CRC_8.msim.vcd
vcd add -internal encoder_CRC_8_v2_vhd_vec_tst/*
vcd add -internal encoder_CRC_8_v2_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

