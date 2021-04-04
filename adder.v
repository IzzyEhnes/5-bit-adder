module TestMod;
    parameter STDIN = 32'h8000_0000;

    reg [7:0] str [1:3]; // typing in 2 chars at a time (decimal # and Enter key)
    reg [4:0] X, Y;      // 5-bit X, Y to sum
    wire [4:0] S;        // 5-bit Sum to see as result
    wire C5;             // like to know this as well from result of adder

    //BigAdder(X, Y, S, C5);

    initial begin
        $display("Time    X             Y             S          C5");
        $display("-------------------------------------------------");
        $monitor("%0d      %d(%b)     %d(%b)     %b", $time, X, X, Y, Y, S, S, C5);
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
    end
endmodule



module BigAdder(X, Y, S, C5);
    input [4:0] X, Y;   // two 5-bit input items
    output [4:0] S;
    output C5;
    wire [3:0] C;

    FullAdderMod(X[0], Y[0], S[0], 0,    C[0]);
    FullAdderMod(X[1], Y[1], S[1], C[0], C[1]);
    FullAdderMod(X[2], Y[2], S[2], C[1], C[2]);
    FullAdderMod(X[3], Y[3], S[3], C[2], C[3]);
    FullAdderMod(X[4], Y[4], S[4], C[3], C[4]);
endmodule