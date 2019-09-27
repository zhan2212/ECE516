clear all;
close all;
clc;

%%
    fileName1 = "v11.mat";
    fileName2 = "v12.mat";
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
%%
f1 = fit(val1_r',val2_r','poly1');
f2 = fit(val1_g',val2_g','poly1');
f3 = fit(val1_b',val2_b','poly1');

subplot(2,2,1)
plot(f2,val1_g,val2_g)
title('fitting for R')
subplot(2,2,2)
plot(f1,val1_r,val2_r)
title('fitting for G')
subplot(2,2,3)
plot(f3,val1_b,val2_b)
title('fitting for B')


%% comparametric function
h1 = @(x) f1.p2/(1-f1.p1) + x^(log2(f1.p1));
h2 = @(x) f2.p2/(1-f2.p1) + x^(log2(f2.p1));
h3 = @(x) f3.p2/(1-f3.p1) + x^(log2(f3.p1));

g1 = @(y) log(y - f1.p2/(1-f1.p1))/log(log2(f1.p1));
g22 = @(y) log(y - f2.p2/(1-f2.p1))/log(log2(f2.p1));
g3 = @(y) log(y - f3.p2/(1-f3.p1))/log(log2(f3.p1));

%%
load("v11_anti.mat")
newI = zeros(1080,1920,3);
for i = 202:1080
    disp(i)
    for j = 1:1920
        new_r = real(g1(2*h1(rgbI2(i,j,1))));
        new_g = real(g22(2*h2(rgbI2(i,j,2))));
        new_b = real(g3(2*h3(rgbI2(i,j,3))));
        newI(i,j,1) = new_r;
        newI(i,j,2) = new_g;
        newI(i,j,3) = new_b;
    end
end

%%

figure();
load("v09_anti.mat")
subplot(2,2,1);
image(cast(rgbI2,'uint8'));
title('v09')

subplot(2,2,2);
image(cast(newI,'uint8'));
title('f(8f^{-1}(v09))')

load("v12_anti.mat")
subplot(2,2,3);
image(cast(rgbI2,'uint8'));
title('v12')





