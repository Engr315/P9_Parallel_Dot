`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Created for Indiana University's E315 Class
//
// 
// Andrew Lukefahr
// lukefahr@iu.edu
//
// 2021-03-24
// 2020-04-27
//
//////////////////////////////////////////////////////////////////////////////////

module dot_4_4(

		// AXI4-Stream Interface
		input                           clk,
		input                           rst,

        // Incomming Matrix AXI4-Stream
		input [31:0]                    INPUT_AXIS_TDATA,
        input                           INPUT_AXIS_TLAST,
        input                           INPUT_AXIS_TVALID,
        output                          INPUT_AXIS_TREADY,
        
        // Outgoing Vector AXI4-Stream 		
		output [31:0]                   OUTPUT_AXIS_TDATA,
        output                          OUTPUT_AXIS_TLAST,
        output                          OUTPUT_AXIS_TVALID,
        input                           OUTPUT_AXIS_TREADY 

    );
    
// This is autogenerated. see python/dot_20_10.py for details. 
parameter ROWS = 4;
parameter COLS = 4;

parameter [31:0] weights [0:ROWS-1] [0:COLS-1] = '{
	'{$shortrealtobits(1.0),$shortrealtobits(2.0),$shortrealtobits(3.0),$shortrealtobits(4.0)},
	'{$shortrealtobits(5.0),$shortrealtobits(6.0),$shortrealtobits(7.0),$shortrealtobits(8.0)},
	'{$shortrealtobits(9.0),$shortrealtobits(10.0),$shortrealtobits(11.0),$shortrealtobits(12.0)},
	'{$shortrealtobits(13.0),$shortrealtobits(14.0),$shortrealtobits(15.0),$shortrealtobits(16.0)}
};


    accel_dot #(
        .ROWS(ROWS),
        .COLS(COLS)
    ) accel_dot0 (
    
		// AXI4-Stream Interface
		.clk(clk),
		.rst(rst),
		
        .weights(weights),

        .INPUT_AXIS_TDATA(INPUT_AXIS_TDATA),
        .INPUT_AXIS_TLAST(INPUT_AXIS_TLAST),
        .INPUT_AXIS_TVALID(INPUT_AXIS_TVALID),
        .INPUT_AXIS_TREADY(INPUT_AXIS_TREADY),
                            
        .OUTPUT_AXIS_TDATA(OUTPUT_AXIS_TDATA),
        .OUTPUT_AXIS_TLAST(OUTPUT_AXIS_TLAST),
        .OUTPUT_AXIS_TVALID(OUTPUT_AXIS_TVALID),
        .OUTPUT_AXIS_TREADY(OUTPUT_AXIS_TREADY) 	

    );

    
endmodule
