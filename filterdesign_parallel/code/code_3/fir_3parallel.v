module fir_12o(data_out_sum0, data_out_sum1, data_out_sum2,data_in,clk,rst);

real input_temp[0:511], sum[0:2], a[-11:511], product_sum0[0:11], product_sum1[0:11], product_sum2[0:11], b[-11:11];
integer index = 0;
initial begin
for(index=-11;index<0;index = index +1)begin
    b[index] = 0;
end
b[0]=0.098891890744637;

b[1]=0.002579421311410;

b[2]=-0.084589441437739;

b[3]=-0.047578154855338;

b[4]=0.179439401283587;

b[5]=0.413044584947859;

b[6]=0.413044584947859;

b[7]=0.179439401283587;

b[8]=-0.047578154855338;

b[9]=-0.084589441437739;

b[10]=0.002579421311410;

b[11]=0.098891890744637;
end

real data_out_real_sum0, data_out_real_sum1, data_out_real_sum2;
output reg[63:0] data_out_sum0;
output reg[63:0] data_out_sum1;
output reg[63:0] data_out_sum2;
input[63:0] data_in;
input clk, rst;
integer i=0, flag, flag_12 = 0, cnt_0 = 0, cnt_1 = 0, cnt_2 = 0, cnt_3 = 0, cnt_4 = 0;
integer cnt_5=0, flag_sum0=0, flag_sum1=0, flag_sum2=0, flag_file=0;
integer fp_w;
initial begin
    fp_w = $fopen("data_out_parallel.txt", "w");
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
        $display("input[%d]:%f",cnt_2,a[cnt_2]);
        cnt_2 = cnt_2+1;
        //if(cnt_2 > 11) begin
        //    cnt_2 = 0;
        //end
    end
end 
always @(posedge clk) begin
    #30; 
    if (rst == 0) begin
        // reset
        sum[0] = 0;
    end
    else begin
        if(cnt_2 > 500)begin
        product_sum0[0] = a[3*cnt_3]*b[0];
        product_sum0[1] = a[3*cnt_3-1]*b[1];
        product_sum0[2] = a[3*cnt_3-2]*b[2];
        product_sum0[3] = a[3*cnt_3-3]*b[3];
        product_sum0[4] = a[3*cnt_3-4]*b[4];
        product_sum0[5] = a[3*cnt_3-5]*b[5];
        product_sum0[6] = a[3*cnt_3-6]*b[6];
        product_sum0[7] = a[3*cnt_3-7]*b[7];
        product_sum0[8] = a[3*cnt_3-8]*b[8];
        product_sum0[9] = a[3*cnt_3-9]*b[9];
        product_sum0[10] = a[3*cnt_3-10]*b[10];
        product_sum0[11] = a[3*cnt_3-11]*b[11];
        $display("sum[0]=%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f",product_sum0[0],product_sum0[1],product_sum0[2],product_sum0[3],product_sum0[4],product_sum0[5],product_sum0[6],product_sum0[7],product_sum0[8],product_sum0[9],product_sum0[10],product_sum0[11]);
        sum[0] = product_sum0[0]+product_sum0[1]+product_sum0[2]+product_sum0[3]+product_sum0[4]+
        product_sum0[5]+product_sum0[6]+product_sum0[7]+product_sum0[8]+product_sum0[9]+product_sum0[10]+product_sum0[11];
        data_out_sum0 = $realtobits(sum[0]);
        data_out_real_sum0 = $bitstoreal(data_out_sum0);
        $display("data out sum[0]---> : %f",  data_out_real_sum0);
        cnt_3 = cnt_3 +1;
        flag_sum0 = 1;
        end
    end
    #30; 
end
always @(posedge clk) begin
    #30; 
    if (rst == 0) begin
        // reset
        sum[1] = 0;
    end
    else begin
    if(cnt_2 > 500)begin
        product_sum1[0] = a[3*cnt_4+1]*b[0];
        product_sum1[1] = a[3*cnt_4]*b[1];
        product_sum1[2] = a[3*cnt_4-1]*b[2];
        product_sum1[3] = a[3*cnt_4-2]*b[3];
        product_sum1[4] = a[3*cnt_4-3]*b[4];
        product_sum1[5] = a[3*cnt_4-4]*b[5];
        product_sum1[6] = a[3*cnt_4-5]*b[6];
        product_sum1[7] = a[3*cnt_4-6]*b[7];
        product_sum1[8] = a[3*cnt_4-7]*b[8];
        product_sum1[9] = a[3*cnt_4-8]*b[9];
        product_sum1[10] = a[3*cnt_4-9]*b[10];
        product_sum1[11] = a[3*cnt_4-10]*b[11];
        $display("sum[1]=%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f",product_sum1[0],product_sum1[1],product_sum1[2],product_sum1[3],product_sum1[4],product_sum1[5],product_sum1[6],product_sum1[7],product_sum1[8],product_sum1[9],product_sum1[10],product_sum1[11]);
        sum[1] = product_sum1[0]+product_sum1[1]+product_sum1[2]+product_sum1[3]+product_sum1[4]+
        product_sum1[5]+product_sum1[6]+product_sum1[7]+product_sum1[8]+product_sum1[9]+product_sum1[10]+product_sum1[11];
        data_out_sum1 = $realtobits(sum[1]);
        data_out_real_sum1 = $bitstoreal(data_out_sum1);
        $display("data out sum[1]---> : %f",  data_out_real_sum1);
        cnt_4 = cnt_4 +1;
        flag_sum1 = 1;
    end
    end
    #30; 
end
always @(posedge clk) begin
    #30; 
    if (rst == 0) begin
        // reset
        sum[2] = 0;
    end
    else begin
    if(cnt_2 > 500)begin
        product_sum2[0] = a[3*cnt_5+2]*b[0];
        product_sum2[1] = a[3*cnt_5+1]*b[1];
        product_sum2[2] = a[3*cnt_5]*b[2];
        product_sum2[3] = a[3*cnt_5-1]*b[3];
        product_sum2[4] = a[3*cnt_5-2]*b[4];
        product_sum2[5] = a[3*cnt_5-3]*b[5];
        product_sum2[6] = a[3*cnt_5-4]*b[6];
        product_sum2[7] = a[3*cnt_5-5]*b[7];
        product_sum2[8] = a[3*cnt_5-6]*b[8];
        product_sum2[9] = a[3*cnt_5-7]*b[9];
        product_sum2[10] = a[3*cnt_5-8]*b[10];
        product_sum2[11] = a[3*cnt_5-9]*b[11];
        $display("sum[2]=%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f+%f",product_sum2[0],product_sum2[1],product_sum2[2],product_sum2[3],product_sum2[4],product_sum2[5],product_sum2[6],product_sum2[7],product_sum2[8],product_sum2[9],product_sum2[10],product_sum2[11]);
        sum[2] = product_sum2[0]+product_sum2[1]+product_sum2[2]+product_sum2[3]+product_sum2[4]+
        product_sum2[5]+product_sum2[6]+product_sum2[7]+product_sum2[8]+product_sum2[9]+product_sum2[10]+product_sum2[11];
        data_out_sum2 = $realtobits(sum[2]);
        data_out_real_sum2 = $bitstoreal(data_out_sum2);
        $display("data out sum[2]---> : %f",  data_out_real_sum2);
        cnt_5 = cnt_5 +1;
        flag_sum2 = 1;
    end
    end
    #30;
end
always @(posedge clk) begin
    #35;
    if (flag_sum0 == 1&flag_sum1== 1&flag_sum2 == 1) begin
        
        $fwrite(fp_w,"%f\n",sum[0]);
        #5;
        $fwrite(fp_w,"%f\n",sum[1]);
        #5;
        $fwrite(fp_w,"%f\n",sum[2]);
        cnt_1 = cnt_1 + 1;
        flag_sum0 = 0;
        flag_sum1 = 0;
        flag_sum2 = 0;
        if (cnt_1 > 175) begin
            #20 $fclose(fp_w);
              //rst = 0;
            #20 $stop;
            end    
    end
end
endmodule

module fir_tb;
    wire [63:0] data_out_sum0;
    wire [63:0] data_out_sum1;
    wire [63:0] data_out_sum2;
    reg [63:0] data_in;
    reg clk;
    reg rst;
    fir_12o uut (
        .data_out_sum0(data_out_sum0),
        .data_out_sum1(data_out_sum1),
        .data_out_sum2(data_out_sum2), 
        .data_in(data_in),
        .clk(clk), 
        .rst(rst)
    );
    integer fp_r, file, i;
    integer flag = 0;
    integer cnt_1 = 0;
    real input_temp[0:511];
    
    initial begin
        $fsdbDumpfile("fir_12o.fsdb");
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
            //$display("input[%d]:%f",i,input_temp[i]); 
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