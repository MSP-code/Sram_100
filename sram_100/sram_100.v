module sram_100(
	// Inputs
	CLOCK_50,
	KEY,
	

/*****************************************************************************/
	

	//  Memory (SDRAM)
	DRAM_DQ,
// 	Memory (SRAM)
	SRAM_DQ,
/*****************************************************************************/
	// Outputs
	// 	Simple
	LEDG,

	//  Memory (SDRAM)
	DRAM_ADDR,
	
	DRAM_BA,
	DRAM_CLK,
	DRAM_CKE,
	DRAM_CS_N,
	DRAM_CAS_N,
	DRAM_RAS_N,
	DRAM_WE_N,
	DRAM_DQM,
	// 	Memory (SRAM)
	SRAM_ADDR,

	SRAM_CE_N,
	SRAM_WE_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_LB_N
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input			CLOCK_50;
input		[ 1: 0]	KEY;


//  Memory (SDRAM)
inout		[15: 0]	DRAM_DQ;
// 	Memory (SRAM)
inout		[15:0]	SRAM_DQ;
// 	Memory (SRAM)
output		[17:0]	SRAM_ADDR;

output				SRAM_CE_N;
output				SRAM_WE_N;
output				SRAM_OE_N;
output				SRAM_UB_N;
output				SRAM_LB_N;

// Outputs
// 	Simple
output		[ 7: 0]	LEDG;

//  Memory (SDRAM)
output		[12: 0]	DRAM_ADDR;

output		[ 1: 0]	DRAM_BA;
output				DRAM_CLK;
output				DRAM_CKE;
output				DRAM_CS_N;
output				DRAM_CAS_N;
output				DRAM_RAS_N;
output				DRAM_WE_N;
output		[ 1: 0]	DRAM_DQM;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
// Used to connect the Nios 2 system clock to the non-shifted output of the PLL
wire				system_clock;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/
sram_100_qsys NiosII (
        .sdram_wire_addr                       (DRAM_ADDR),                       //                     sdram_wire.addr
        .sdram_wire_ba                         (DRAM_BA),                         //                               .ba
        .sdram_wire_cas_n                      (DRAM_CAS_N),                      //                               .cas_n
        .sdram_wire_cke                        (DRAM_CKE),                        //                               .cke
        .sdram_wire_cs_n                       (DRAM_CS_N),                       //                               .cs_n
        .sdram_wire_dq                         (DRAM_DQ),                         //                               .dq
        .sdram_wire_dqm                        (DRAM_DQM),                        //                               .dqm
        .sdram_wire_ras_n                      (DRAM_RAS_N),                      //                               .ras_n
        .sdram_wire_we_n                       (DRAM_WE_N),                       //                               .we_n
        .pushbuttons_external_interface_export ({KEY[1], 1'b1}), // pushbuttons_external_interface.export
        .green_leds_external_interface_export  (LEDG),  //  green_leds_external_interface.export
        .sram_external_interface_DQ            (SRAM_DQ),            //        sram_external_interface.DQ
        .sram_external_interface_ADDR          (SRAM_ADDR),          //                               .ADDR
        .sram_external_interface_LB_N          (SRAM_LB_N),          //                               .LB_N
        .sram_external_interface_UB_N          (SRAM_UB_N),          //                               .UB_N
        .sram_external_interface_CE_N          (SRAM_CE_N),          //                               .CE_N
        .sram_external_interface_OE_N          (SRAM_OE_N),          //                               .OE_N
        .sram_external_interface_WE_N          (SRAM_WE_N),          //                               .WE_N
        .reset_reset_n                         (KEY[0]),                         //                          reset.reset_n
        .clk_clk                               (system_clock)                                //                            clk.clk
    );

srampll neg_3ns (CLOCK_50,  system_clock, DRAM_CLK);


endmodule