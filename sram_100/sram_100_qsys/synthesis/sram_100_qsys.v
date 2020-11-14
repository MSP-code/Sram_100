// sram_100_qsys.v

// Generated using ACDS version 14.0 200 at 2020.11.14.17:36:03

`timescale 1 ps / 1 ps
module sram_100_qsys (
		output wire [12:0] sdram_wire_addr,                       //                     sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,                         //                               .ba
		output wire        sdram_wire_cas_n,                      //                               .cas_n
		output wire        sdram_wire_cke,                        //                               .cke
		output wire        sdram_wire_cs_n,                       //                               .cs_n
		inout  wire [15:0] sdram_wire_dq,                         //                               .dq
		output wire [1:0]  sdram_wire_dqm,                        //                               .dqm
		output wire        sdram_wire_ras_n,                      //                               .ras_n
		output wire        sdram_wire_we_n,                       //                               .we_n
		input  wire [1:0]  pushbuttons_external_interface_export, // pushbuttons_external_interface.export
		output wire [7:0]  green_leds_external_interface_export,  //  green_leds_external_interface.export
		input  wire        reset_reset_n,                         //                          reset.reset_n
		input  wire        clk_clk,                               //                            clk.clk
		inout  wire [15:0] sram_external_interface_DQ,            //        sram_external_interface.DQ
		output wire [19:0] sram_external_interface_ADDR,          //                               .ADDR
		output wire        sram_external_interface_LB_N,          //                               .LB_N
		output wire        sram_external_interface_UB_N,          //                               .UB_N
		output wire        sram_external_interface_CE_N,          //                               .CE_N
		output wire        sram_external_interface_OE_N,          //                               .OE_N
		output wire        sram_external_interface_WE_N           //                               .WE_N
	);

	wire         cpu_instruction_master_waitrequest;                                  // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [26:0] cpu_instruction_master_address;                                      // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                                         // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire  [31:0] cpu_instruction_master_readdata;                                     // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_readdatavalid;                                // mm_interconnect_0:cpu_instruction_master_readdatavalid -> cpu:i_readdatavalid
	wire         cpu_data_master_waitrequest;                                         // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire  [31:0] cpu_data_master_writedata;                                           // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [26:0] cpu_data_master_address;                                             // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire         cpu_data_master_write;                                               // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire         cpu_data_master_read;                                                // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire  [31:0] cpu_data_master_readdata;                                            // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_debugaccess;                                         // cpu:jtag_debug_module_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire         cpu_data_master_readdatavalid;                                       // mm_interconnect_0:cpu_data_master_readdatavalid -> cpu:d_readdatavalid
	wire   [3:0] cpu_data_master_byteenable;                                          // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire         mm_interconnect_0_cpu_jtag_debug_module_waitrequest;                 // cpu:jtag_debug_module_waitrequest -> mm_interconnect_0:cpu_jtag_debug_module_waitrequest
	wire  [31:0] mm_interconnect_0_cpu_jtag_debug_module_writedata;                   // mm_interconnect_0:cpu_jtag_debug_module_writedata -> cpu:jtag_debug_module_writedata
	wire   [8:0] mm_interconnect_0_cpu_jtag_debug_module_address;                     // mm_interconnect_0:cpu_jtag_debug_module_address -> cpu:jtag_debug_module_address
	wire         mm_interconnect_0_cpu_jtag_debug_module_write;                       // mm_interconnect_0:cpu_jtag_debug_module_write -> cpu:jtag_debug_module_write
	wire         mm_interconnect_0_cpu_jtag_debug_module_read;                        // mm_interconnect_0:cpu_jtag_debug_module_read -> cpu:jtag_debug_module_read
	wire  [31:0] mm_interconnect_0_cpu_jtag_debug_module_readdata;                    // cpu:jtag_debug_module_readdata -> mm_interconnect_0:cpu_jtag_debug_module_readdata
	wire         mm_interconnect_0_cpu_jtag_debug_module_debugaccess;                 // mm_interconnect_0:cpu_jtag_debug_module_debugaccess -> cpu:jtag_debug_module_debugaccess
	wire   [3:0] mm_interconnect_0_cpu_jtag_debug_module_byteenable;                  // mm_interconnect_0:cpu_jtag_debug_module_byteenable -> cpu:jtag_debug_module_byteenable
	wire         mm_interconnect_0_sdram_s1_waitrequest;                              // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;                                // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire  [23:0] mm_interconnect_0_sdram_s1_address;                                  // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_chipselect;                               // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire         mm_interconnect_0_sdram_s1_write;                                    // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire         mm_interconnect_0_sdram_s1_read;                                     // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;                                 // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_readdatavalid;                            // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;                               // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest;           // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;             // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;               // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;            // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;                 // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;                  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;              // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire  [31:0] mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_writedata;  // mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_writedata -> Pushbuttons:writedata
	wire   [1:0] mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_address;    // mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_address -> Pushbuttons:address
	wire         mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_chipselect; // mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_chipselect -> Pushbuttons:chipselect
	wire         mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_write;      // mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_write -> Pushbuttons:write
	wire         mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_read;       // mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_read -> Pushbuttons:read
	wire  [31:0] mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_readdata;   // Pushbuttons:readdata -> mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_readdata
	wire   [3:0] mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_byteenable; // mm_interconnect_0:Pushbuttons_avalon_parallel_port_slave_byteenable -> Pushbuttons:byteenable
	wire  [15:0] mm_interconnect_0_sram_avalon_sram_slave_writedata;                  // mm_interconnect_0:sram_avalon_sram_slave_writedata -> sram:writedata
	wire  [19:0] mm_interconnect_0_sram_avalon_sram_slave_address;                    // mm_interconnect_0:sram_avalon_sram_slave_address -> sram:address
	wire         mm_interconnect_0_sram_avalon_sram_slave_write;                      // mm_interconnect_0:sram_avalon_sram_slave_write -> sram:write
	wire         mm_interconnect_0_sram_avalon_sram_slave_read;                       // mm_interconnect_0:sram_avalon_sram_slave_read -> sram:read
	wire  [15:0] mm_interconnect_0_sram_avalon_sram_slave_readdata;                   // sram:readdata -> mm_interconnect_0:sram_avalon_sram_slave_readdata
	wire         mm_interconnect_0_sram_avalon_sram_slave_readdatavalid;              // sram:readdatavalid -> mm_interconnect_0:sram_avalon_sram_slave_readdatavalid
	wire   [1:0] mm_interconnect_0_sram_avalon_sram_slave_byteenable;                 // mm_interconnect_0:sram_avalon_sram_slave_byteenable -> sram:byteenable
	wire  [31:0] mm_interconnect_0_green_leds_avalon_parallel_port_slave_writedata;   // mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_writedata -> Green_LEDs:writedata
	wire   [1:0] mm_interconnect_0_green_leds_avalon_parallel_port_slave_address;     // mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_address -> Green_LEDs:address
	wire         mm_interconnect_0_green_leds_avalon_parallel_port_slave_chipselect;  // mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_chipselect -> Green_LEDs:chipselect
	wire         mm_interconnect_0_green_leds_avalon_parallel_port_slave_write;       // mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_write -> Green_LEDs:write
	wire         mm_interconnect_0_green_leds_avalon_parallel_port_slave_read;        // mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_read -> Green_LEDs:read
	wire  [31:0] mm_interconnect_0_green_leds_avalon_parallel_port_slave_readdata;    // Green_LEDs:readdata -> mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_readdata
	wire   [3:0] mm_interconnect_0_green_leds_avalon_parallel_port_slave_byteenable;  // mm_interconnect_0:Green_LEDs_avalon_parallel_port_slave_byteenable -> Green_LEDs:byteenable
	wire   [0:0] mm_interconnect_0_sysid_control_slave_address;                       // mm_interconnect_0:sysid_control_slave_address -> sysid:address
	wire  [31:0] mm_interconnect_0_sysid_control_slave_readdata;                      // sysid:readdata -> mm_interconnect_0:sysid_control_slave_readdata
	wire         irq_mapper_receiver0_irq;                                            // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                            // Pushbuttons:irq -> irq_mapper:receiver1_irq
	wire  [31:0] cpu_d_irq_irq;                                                       // irq_mapper:sender_irq -> cpu:d_irq
	wire         rst_controller_reset_out_reset;                                      // rst_controller:reset_out -> [cpu:reset_n, irq_mapper:reset, jtag_uart:rst_n, mm_interconnect_0:cpu_reset_n_reset_bridge_in_reset_reset, rst_translator:in_reset, sdram:reset_n, sysid:reset_n]
	wire         rst_controller_reset_out_reset_req;                                  // rst_controller:reset_req -> [cpu:reset_req, rst_translator:reset_req_in]
	wire         cpu_jtag_debug_module_reset_reset;                                   // cpu:jtag_debug_module_resetrequest -> rst_controller:reset_in0

	sram_100_qsys_cpu cpu (
		.clk                                   (clk_clk),                                             //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                     //                   reset_n.reset_n
		.reset_req                             (rst_controller_reset_out_reset_req),                  //                          .reset_req
		.d_address                             (cpu_data_master_address),                             //               data_master.address
		.d_byteenable                          (cpu_data_master_byteenable),                          //                          .byteenable
		.d_read                                (cpu_data_master_read),                                //                          .read
		.d_readdata                            (cpu_data_master_readdata),                            //                          .readdata
		.d_waitrequest                         (cpu_data_master_waitrequest),                         //                          .waitrequest
		.d_write                               (cpu_data_master_write),                               //                          .write
		.d_writedata                           (cpu_data_master_writedata),                           //                          .writedata
		.d_readdatavalid                       (cpu_data_master_readdatavalid),                       //                          .readdatavalid
		.jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),                         //                          .debugaccess
		.i_address                             (cpu_instruction_master_address),                      //        instruction_master.address
		.i_read                                (cpu_instruction_master_read),                         //                          .read
		.i_readdata                            (cpu_instruction_master_readdata),                     //                          .readdata
		.i_waitrequest                         (cpu_instruction_master_waitrequest),                  //                          .waitrequest
		.i_readdatavalid                       (cpu_instruction_master_readdatavalid),                //                          .readdatavalid
		.d_irq                                 (cpu_d_irq_irq),                                       //                     d_irq.irq
		.jtag_debug_module_resetrequest        (cpu_jtag_debug_module_reset_reset),                   //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (mm_interconnect_0_cpu_jtag_debug_module_address),     //         jtag_debug_module.address
		.jtag_debug_module_byteenable          (mm_interconnect_0_cpu_jtag_debug_module_byteenable),  //                          .byteenable
		.jtag_debug_module_debugaccess         (mm_interconnect_0_cpu_jtag_debug_module_debugaccess), //                          .debugaccess
		.jtag_debug_module_read                (mm_interconnect_0_cpu_jtag_debug_module_read),        //                          .read
		.jtag_debug_module_readdata            (mm_interconnect_0_cpu_jtag_debug_module_readdata),    //                          .readdata
		.jtag_debug_module_waitrequest         (mm_interconnect_0_cpu_jtag_debug_module_waitrequest), //                          .waitrequest
		.jtag_debug_module_write               (mm_interconnect_0_cpu_jtag_debug_module_write),       //                          .write
		.jtag_debug_module_writedata           (mm_interconnect_0_cpu_jtag_debug_module_writedata),   //                          .writedata
		.no_ci_readra                          ()                                                     // custom_instruction_master.readra
	);

	sram_100_qsys_sysid sysid (
		.clock    (clk_clk),                                        //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_control_slave_address)   //              .address
	);

	sram_100_qsys_sdram sdram (
		.clk            (clk_clk),                                  //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),          // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                          //  wire.export
		.zs_ba          (sdram_wire_ba),                            //      .export
		.zs_cas_n       (sdram_wire_cas_n),                         //      .export
		.zs_cke         (sdram_wire_cke),                           //      .export
		.zs_cs_n        (sdram_wire_cs_n),                          //      .export
		.zs_dq          (sdram_wire_dq),                            //      .export
		.zs_dqm         (sdram_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_wire_we_n)                           //      .export
	);

	sram_100_qsys_jtag_uart jtag_uart (
		.clk            (clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	sram_100_qsys_Pushbuttons pushbuttons (
		.clk        (clk_clk),                                                             //                        clk.clk
		.reset      (~reset_reset_n),                                                      //                      reset.reset
		.address    (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_address),    // avalon_parallel_port_slave.address
		.byteenable (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_byteenable), //                           .byteenable
		.chipselect (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_chipselect), //                           .chipselect
		.read       (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_read),       //                           .read
		.write      (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_write),      //                           .write
		.writedata  (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_writedata),  //                           .writedata
		.readdata   (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_readdata),   //                           .readdata
		.KEY        (pushbuttons_external_interface_export),                               //         external_interface.export
		.irq        (irq_mapper_receiver1_irq)                                             //                  interrupt.irq
	);

	sram_100_qsys_Green_LEDs green_leds (
		.clk        (clk_clk),                                                            //                        clk.clk
		.reset      (~reset_reset_n),                                                     //                      reset.reset
		.address    (mm_interconnect_0_green_leds_avalon_parallel_port_slave_address),    // avalon_parallel_port_slave.address
		.byteenable (mm_interconnect_0_green_leds_avalon_parallel_port_slave_byteenable), //                           .byteenable
		.chipselect (mm_interconnect_0_green_leds_avalon_parallel_port_slave_chipselect), //                           .chipselect
		.read       (mm_interconnect_0_green_leds_avalon_parallel_port_slave_read),       //                           .read
		.write      (mm_interconnect_0_green_leds_avalon_parallel_port_slave_write),      //                           .write
		.writedata  (mm_interconnect_0_green_leds_avalon_parallel_port_slave_writedata),  //                           .writedata
		.readdata   (mm_interconnect_0_green_leds_avalon_parallel_port_slave_readdata),   //                           .readdata
		.LEDG       (green_leds_external_interface_export)                                //         external_interface.export
	);

	sram_100_qsys_sram sram (
		.clk           (clk_clk),                                                //                clk.clk
		.reset         (~reset_reset_n),                                         //              reset.reset
		.SRAM_DQ       (sram_external_interface_DQ),                             // external_interface.export
		.SRAM_ADDR     (sram_external_interface_ADDR),                           //                   .export
		.SRAM_LB_N     (sram_external_interface_LB_N),                           //                   .export
		.SRAM_UB_N     (sram_external_interface_UB_N),                           //                   .export
		.SRAM_CE_N     (sram_external_interface_CE_N),                           //                   .export
		.SRAM_OE_N     (sram_external_interface_OE_N),                           //                   .export
		.SRAM_WE_N     (sram_external_interface_WE_N),                           //                   .export
		.address       (mm_interconnect_0_sram_avalon_sram_slave_address),       //  avalon_sram_slave.address
		.byteenable    (mm_interconnect_0_sram_avalon_sram_slave_byteenable),    //                   .byteenable
		.read          (mm_interconnect_0_sram_avalon_sram_slave_read),          //                   .read
		.write         (mm_interconnect_0_sram_avalon_sram_slave_write),         //                   .write
		.writedata     (mm_interconnect_0_sram_avalon_sram_slave_writedata),     //                   .writedata
		.readdata      (mm_interconnect_0_sram_avalon_sram_slave_readdata),      //                   .readdata
		.readdatavalid (mm_interconnect_0_sram_avalon_sram_slave_readdatavalid)  //                   .readdatavalid
	);

	sram_100_qsys_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                                       (clk_clk),                                                             //                                 clk_clk.clk
		.cpu_reset_n_reset_bridge_in_reset_reset           (rst_controller_reset_out_reset),                                      //       cpu_reset_n_reset_bridge_in_reset.reset
		.Pushbuttons_reset_reset_bridge_in_reset_reset     (~reset_reset_n),                                                      // Pushbuttons_reset_reset_bridge_in_reset.reset
		.cpu_data_master_address                           (cpu_data_master_address),                                             //                         cpu_data_master.address
		.cpu_data_master_waitrequest                       (cpu_data_master_waitrequest),                                         //                                        .waitrequest
		.cpu_data_master_byteenable                        (cpu_data_master_byteenable),                                          //                                        .byteenable
		.cpu_data_master_read                              (cpu_data_master_read),                                                //                                        .read
		.cpu_data_master_readdata                          (cpu_data_master_readdata),                                            //                                        .readdata
		.cpu_data_master_readdatavalid                     (cpu_data_master_readdatavalid),                                       //                                        .readdatavalid
		.cpu_data_master_write                             (cpu_data_master_write),                                               //                                        .write
		.cpu_data_master_writedata                         (cpu_data_master_writedata),                                           //                                        .writedata
		.cpu_data_master_debugaccess                       (cpu_data_master_debugaccess),                                         //                                        .debugaccess
		.cpu_instruction_master_address                    (cpu_instruction_master_address),                                      //                  cpu_instruction_master.address
		.cpu_instruction_master_waitrequest                (cpu_instruction_master_waitrequest),                                  //                                        .waitrequest
		.cpu_instruction_master_read                       (cpu_instruction_master_read),                                         //                                        .read
		.cpu_instruction_master_readdata                   (cpu_instruction_master_readdata),                                     //                                        .readdata
		.cpu_instruction_master_readdatavalid              (cpu_instruction_master_readdatavalid),                                //                                        .readdatavalid
		.cpu_jtag_debug_module_address                     (mm_interconnect_0_cpu_jtag_debug_module_address),                     //                   cpu_jtag_debug_module.address
		.cpu_jtag_debug_module_write                       (mm_interconnect_0_cpu_jtag_debug_module_write),                       //                                        .write
		.cpu_jtag_debug_module_read                        (mm_interconnect_0_cpu_jtag_debug_module_read),                        //                                        .read
		.cpu_jtag_debug_module_readdata                    (mm_interconnect_0_cpu_jtag_debug_module_readdata),                    //                                        .readdata
		.cpu_jtag_debug_module_writedata                   (mm_interconnect_0_cpu_jtag_debug_module_writedata),                   //                                        .writedata
		.cpu_jtag_debug_module_byteenable                  (mm_interconnect_0_cpu_jtag_debug_module_byteenable),                  //                                        .byteenable
		.cpu_jtag_debug_module_waitrequest                 (mm_interconnect_0_cpu_jtag_debug_module_waitrequest),                 //                                        .waitrequest
		.cpu_jtag_debug_module_debugaccess                 (mm_interconnect_0_cpu_jtag_debug_module_debugaccess),                 //                                        .debugaccess
		.Green_LEDs_avalon_parallel_port_slave_address     (mm_interconnect_0_green_leds_avalon_parallel_port_slave_address),     //   Green_LEDs_avalon_parallel_port_slave.address
		.Green_LEDs_avalon_parallel_port_slave_write       (mm_interconnect_0_green_leds_avalon_parallel_port_slave_write),       //                                        .write
		.Green_LEDs_avalon_parallel_port_slave_read        (mm_interconnect_0_green_leds_avalon_parallel_port_slave_read),        //                                        .read
		.Green_LEDs_avalon_parallel_port_slave_readdata    (mm_interconnect_0_green_leds_avalon_parallel_port_slave_readdata),    //                                        .readdata
		.Green_LEDs_avalon_parallel_port_slave_writedata   (mm_interconnect_0_green_leds_avalon_parallel_port_slave_writedata),   //                                        .writedata
		.Green_LEDs_avalon_parallel_port_slave_byteenable  (mm_interconnect_0_green_leds_avalon_parallel_port_slave_byteenable),  //                                        .byteenable
		.Green_LEDs_avalon_parallel_port_slave_chipselect  (mm_interconnect_0_green_leds_avalon_parallel_port_slave_chipselect),  //                                        .chipselect
		.jtag_uart_avalon_jtag_slave_address               (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),               //             jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write                 (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),                 //                                        .write
		.jtag_uart_avalon_jtag_slave_read                  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),                  //                                        .read
		.jtag_uart_avalon_jtag_slave_readdata              (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),              //                                        .readdata
		.jtag_uart_avalon_jtag_slave_writedata             (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),             //                                        .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest           (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest),           //                                        .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect            (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),            //                                        .chipselect
		.Pushbuttons_avalon_parallel_port_slave_address    (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_address),    //  Pushbuttons_avalon_parallel_port_slave.address
		.Pushbuttons_avalon_parallel_port_slave_write      (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_write),      //                                        .write
		.Pushbuttons_avalon_parallel_port_slave_read       (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_read),       //                                        .read
		.Pushbuttons_avalon_parallel_port_slave_readdata   (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_readdata),   //                                        .readdata
		.Pushbuttons_avalon_parallel_port_slave_writedata  (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_writedata),  //                                        .writedata
		.Pushbuttons_avalon_parallel_port_slave_byteenable (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_byteenable), //                                        .byteenable
		.Pushbuttons_avalon_parallel_port_slave_chipselect (mm_interconnect_0_pushbuttons_avalon_parallel_port_slave_chipselect), //                                        .chipselect
		.sdram_s1_address                                  (mm_interconnect_0_sdram_s1_address),                                  //                                sdram_s1.address
		.sdram_s1_write                                    (mm_interconnect_0_sdram_s1_write),                                    //                                        .write
		.sdram_s1_read                                     (mm_interconnect_0_sdram_s1_read),                                     //                                        .read
		.sdram_s1_readdata                                 (mm_interconnect_0_sdram_s1_readdata),                                 //                                        .readdata
		.sdram_s1_writedata                                (mm_interconnect_0_sdram_s1_writedata),                                //                                        .writedata
		.sdram_s1_byteenable                               (mm_interconnect_0_sdram_s1_byteenable),                               //                                        .byteenable
		.sdram_s1_readdatavalid                            (mm_interconnect_0_sdram_s1_readdatavalid),                            //                                        .readdatavalid
		.sdram_s1_waitrequest                              (mm_interconnect_0_sdram_s1_waitrequest),                              //                                        .waitrequest
		.sdram_s1_chipselect                               (mm_interconnect_0_sdram_s1_chipselect),                               //                                        .chipselect
		.sram_avalon_sram_slave_address                    (mm_interconnect_0_sram_avalon_sram_slave_address),                    //                  sram_avalon_sram_slave.address
		.sram_avalon_sram_slave_write                      (mm_interconnect_0_sram_avalon_sram_slave_write),                      //                                        .write
		.sram_avalon_sram_slave_read                       (mm_interconnect_0_sram_avalon_sram_slave_read),                       //                                        .read
		.sram_avalon_sram_slave_readdata                   (mm_interconnect_0_sram_avalon_sram_slave_readdata),                   //                                        .readdata
		.sram_avalon_sram_slave_writedata                  (mm_interconnect_0_sram_avalon_sram_slave_writedata),                  //                                        .writedata
		.sram_avalon_sram_slave_byteenable                 (mm_interconnect_0_sram_avalon_sram_slave_byteenable),                 //                                        .byteenable
		.sram_avalon_sram_slave_readdatavalid              (mm_interconnect_0_sram_avalon_sram_slave_readdatavalid),              //                                        .readdatavalid
		.sysid_control_slave_address                       (mm_interconnect_0_sysid_control_slave_address),                       //                     sysid_control_slave.address
		.sysid_control_slave_readdata                      (mm_interconnect_0_sysid_control_slave_readdata)                       //                                        .readdata
	);

	sram_100_qsys_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.sender_irq    (cpu_d_irq_irq)                   //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (cpu_jtag_debug_module_reset_reset),  // reset_in0.reset
		.reset_in1      (~reset_reset_n),                     // reset_in1.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
