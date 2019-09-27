clear all;
close all;
clc;

%%
for v = 1:11
    if v < 10
        fileName1 = "v0"+string(v)+".mat";
    else
        fileName1 = "v"+string(v)+".mat";
    end
    if v+1 < 10
        fileName2 = "v0"+string(v+1)+".mat";
    else
        fileName2 = "v"+string(v+1)+".mat";
    end
    
    load(fileName1);
    I1 = rgbI;
    load(fileName2);
    I2 = rgbI;

    iter = 0;
    for i = 1:size(I1,1)
        for j = 1:size(I2,2)
            iter = iter + 1;
            val1_r(iter) = I1(i,j,1);
            val2_r(iter) = I2(i,j,1);
            val1_g(iter) = I1(i,j,2);
            val2_g(iter) = I2(i,j,2);
            val1_b(iter) = I1(i,j,3);
            val2_b(iter) = I2(i,j,3);
        end
    end

    figure();
    subplot(2,2,1)
    plot(val1_r,val2_r,'.');
    title('R')
    
    subplot(2,2,2)
    plot(val1_g,val2_g,'.');
    title('G')
    
    subplot(2,2,3)
    plot(val1_b,val2_b,'.');
    title('B')

end