
module fadder ( a, b, cin, sum_out, c_out );
  input a, b, cin;
  output sum_out, c_out;


  XOR3X1 U1 ( .IN1(b), .IN2(a), .IN3(cin), .Q(sum_out) );
  AO222X1 U2 ( .IN1(cin), .IN2(b), .IN3(cin), .IN4(a), .IN5(b), .IN6(a), .Q(
        c_out) );
endmodule

