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