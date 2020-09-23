module fir_12o(data_out,data_in,clk,rst);

real input_temp[0:511], sum, a[-11:511], product[0:11], b[-11:11];
real b0, b1, b2, b3, b4, b5;
real x1, x2, x3, x4, x5, x6;
integer index = 0;
initial begin

x1 = 0.50;
x2 = x1 - x1*2.0**-2.0;
x3 = x2 + x1*2.0**-5.0;
x4 = x3 + x1*2.0**-7.0;
x5 = x4 + x1*2.0**-9.0;
x6 = x5 + x1*2.0**-14.0;

b[0]=x6*2.0**-2.0;
$display("%f", b[0]);
b[1]=x1*2.0**-8.0+x1*2.0**-10.0+x1*2.0**-12.0+x1*2.0**-15.0;
$display("%f", b[1]);
b[2]=-x2*2.0**-2.0+x1*2.0**-6.0+x2*2.0**-8.0-x1*2.0**-12.0+x1*2.0**-16.0;
$display("%f", b[2]);
b[3]=-x2*2.0**-3.0 + x2*2.0**-9.0 + x1*2.0**-14.0;
$display("%f", b[3]);
b[4]=x2*2.0**-1.0 - x1*2.0**-5.0 - x1*2.0**-10.0 - x1*2.0**-15.0;
$display("%f", b[4]);
b[5]=x2 + x1*2.0**-4.0 + x1*2.0**-6.0 - x1*2.0**-9.0 - x2*2.0**-13.0;
$display("%f", b[5]);
end

real data_out_real;
output reg[63:0] data_out;
input[63:0] data_in;
input clk, rst;
integer i=0, flag, flag_12 = 0, cnt_0 = 0, cnt_1 = 0, cnt_2 = 0, cnt_3 = 0, cnt_4 = 1;
integer fp_w;
initial begin
    fp_w = $fopen("data_out_csd.txt", "w");
end
always @(posedge clk) begin
    #20;
    if (rst == 0) begin
        // reset
        for(i=-11;i<512;i=i+1)begin
            a[i] = 0;
        end
    end
    else begin
        a[cnt_2] = $bitstoreal(data_in);
        //$display("input[%d]:%f",cnt_2,a[cnt_2]);
        cnt_2 = cnt_2+1;
        //if(cnt_2 > 11) begin
        //    cnt_2 = 0;
        //end
    end
end
always @(posedge clk) begin
    #25;
    if (rst == 0) begin
        // reset
        for(i=0;i<12;i=i+1)begin
            product[i] = 0;
        end
    end
    else begin
    
        product[0] = a[cnt_3]*b[0];
        product[1] = a[cnt_3-1]*b[1];
        product[2] = a[cnt_3-2]*b[2];
        product[3] = a[cnt_3-3]*b[3];
        product[4] = a[cnt_3-4]*b[4];
        product[5] = a[cnt_3-5]*b[5];
        product[6] = a[cnt_3-6]*b[5];
        product[7] = a[cnt_3-7]*b[4];
        product[8] = a[cnt_3-8]*b[3];
        product[9] = a[cnt_3-9]*b[2];
        product[10] = a[cnt_3-10]*b[1];
        product[11] = a[cnt_3-11]*b[0];
        cnt_3 = cnt_3 +1;
    
    end
end
always @(posedge clk) begin
    #30; 
    if (rst == 0) begin
        // reset
        sum = 0;
    end
    else begin
        $display("sum=%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f",product[0],product[1],product[2],product[3],product[4],product[5],product[6],product[7],product[8],product[9],product[10],product[11]);
        sum = product[0]+product[1]+product[2]+product[3]+product[4]+
        product[5]+product[6]+product[7]+product[8]+product[9]+product[10]+product[11];
        data_out = $realtobits(sum);
        data_out_real = $bitstoreal(data_out);
        $display("data out (%d)---> : %f" , cnt_1, data_out_real);
        $fwrite(fp_w,"%f\n",data_out_real);
        cnt_1 = cnt_1 + 1;
        if (cnt_1 > 511) begin
            #20 $fclose(fp_w);
              //rst <= 0;
            #20 $stop;
            end 
        
        
    end
end
endmodule

module fir_tb;
    wire [63:0] data_out;
    reg [63:0] data_in;
    reg clk;
    reg rst;
    fir_12o uut (
        .data_out(data_out), 
        .data_in(data_in),
        .clk(clk), 
        .rst(rst)
    );
    integer fp_r, file, i;
    integer flag = 0;
    integer cnt_1 = 0;
    real input_temp[0:511];
    initial begin
        $fsdbDumpfile("fir_12o_csd.fsdb");
        $fsdbDumpvars;
    end
    // define reset time
    initial begin
        rst = 0;
        #1;
        rst = 1;
    end
    // define clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
     fp_r = $fopen("data_in.txt", "r");
     if(!$feof(fp_r)) begin
        for(i = 0;i<512;i=i+1)begin
            file = $fscanf(fp_r, "%f", input_temp[i]);
            $display("input[%d]:%f",i,input_temp[i]); 
        end
        flag = 1;
    end
    end

    always @(posedge clk) begin
        if (flag == 1) begin
            data_in = $realtobits(input_temp[cnt_1]);   
            cnt_1 = cnt_1 +1;                 
        end     
    end

endmodule