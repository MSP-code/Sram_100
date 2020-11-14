/******************************************************************************
 patches for 100 Mhz
 ******************************************************************************/

/******************************************************************************
 *                                                                            *
 * This module chipselects reads and writes to the sram, with 2-cycle         *
 *  read latency and one cycle write latency.                                 *
 *                                                                            *
 ******************************************************************************/
//
/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
/
input			[17: 0]	address;// should be 17


output reg	[17: 0]	SRAM_ADDR;		// should be 17


/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires

// Internal Registers
reg						is_read,is_read2;// added read2
// By this one stage is added to read sequence which give 50MHz read

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge clk)
begin
	readdata			<= SRAM_DQ;
	
	//readdatavalid	<= is_read; //comment this row
	is_read2<=is_read; //add this row
	
	readdatavalid	<= is_read2;//and this one
//all rest is the same
	SRAM_ADDR		<= address;
	SRAM_LB_N		<= ~(byteenable[0] & (read | write));
	SRAM_UB_N		<= ~(byteenable[1] & (read | write));
	SRAM_CE_N		<= ~(read | write);
	SRAM_OE_N		<= ~read;
	SRAM_WE_N		<= ~write;
	
end
//all rest rows as in initital module

endmodule

