// Izzy Ehnes
// addder.v, simulated 5-bit adder, 137 Verilog Programming Assignment
// Version: Icarus Verilog v. 11.0
// Compile: $ iverilog -o adder adder.v
// Run: $ vvp adder

module TestMod;
    parameter STDIN = 32'h8000_0000; // I/O address of keyboard input channel

    reg [7:0] str [1:3]; // typing in 2 chars at a time (decimal # and Enter key)
    reg [4:0] X, Y;      // 5-bit X, Y to sum
    wire [4:0] S;        // 5-bit Sum to see as result
    wire C5;             // like to know this as well from result of adder

    BigAdder BA(X, Y, S, C5); // Instantiate BigAdder module

    initial begin
        $display("Time    X             Y             S          C5");
        $display("------------------------------------------------------");
        $monitor("%0d      %d(%b)     %d(%b)     %d(%b)   %d", $time, X, X, Y, Y, S, S, C5);
    end
   
    initial begin
        X = 1'b00001;
        Y = 1'b00001;
        #1;

        X = 2'b00010;
        Y = 5'b00101;
        #1;

        X = 10'b01010;
        Y = 15'b01111;
        #1;

        X = 17'b10001;
        Y = 19'b10011;
        #1;
    
        X = 1'b00001;
        Y = 31'b11111;
        #1;

        X = 31'b11111;
        Y = 31'b11111;
        #1;

        $display("Done");
    end
endmodule



module BigAdder(X, Y, S, C5);
    input [4:0] X, Y; // two 5-bit input items
    
    output [4:0] S; // the sum of X and Y
    output C5;
    
    wire C0 = 0;
    wire C1, C2, C3, C4;

    FullAdderMod FAM1(X[0], Y[0], S[0], C0, C1);
    FullAdderMod FAM2(X[1], Y[1], S[1], C1, C2);
    FullAdderMod FAM3(X[2], Y[2], S[2], C2, C3);
    FullAdderMod FAM4(X[3], Y[3], S[3], C3, C4);
    FullAdderMod FAM5(X[4], Y[4], S[4], C4, C5);
endmodule



module FullAdderMod(X, Y, S, Ci, Co);
    input X, Y, Ci;
    output wire S, Co;

    assign S = (X ^ Y) ^ Ci;
    assign Co = (X & Y) | (Ci & (X ^ Y));
endmodule