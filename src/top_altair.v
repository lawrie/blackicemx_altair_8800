module top
(
  input clk_25mhz,
  input rx,
  output tx,
  output [7:0] led
);

  reg [12:0] reset_cnt;
  wire resetn = &reset_cnt;

  always @(posedge clk_25mhz) begin
    reset_cnt <= reset_cnt + !resetn;
  end

  altair machine(
    .clk(clk_25mhz),
    .reset(~resetn),
    .rx(rx),
    .tx(tx),
    .led(led)
  );

endmodule
