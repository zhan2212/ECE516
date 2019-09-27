clear all;
close all;
clc;

%%
l = csvread('l_1.csv');
m = csvread('m_2.csv');
h = csvread('h_2.csv');

l(:,2) = l(:,2) - mean(l(:,2));
m(:,2) = m(:,2) - mean(m(:,2));
h(:,2) = h(:,2) - mean(h(:,2));

%plot(h(:,1),h(:,2))

%%
min_l = l(1,1);
max_l = l(290,1);
min_m = m(1,1);
max_m = m(290,1);
min_h = h(1,1);
max_h = h(200,1);
h = [zeros(90,2);h];

%% v1
for i = 1:290
    if i<100
        q(i) = (prob(min_l,max_l,l(i,1))*l(i,2) + prob(min_m,max_m,m(i,1))*m(i,2)/3)/...
            (prob(min_l,max_l,l(i,1)) + prob(min_m,max_m,m(i,1)));
    else
        q(i) = (prob(min_l,max_l,l(i,1))*l(i,2) + prob(min_m,max_m,m(i,1))*m(i,2)/3 + prob(min_h,max_h,h(i,1))*h(i,2)/10)/...
            (prob(min_l,max_l,l(i,1)) + prob(min_m,max_m,m(i,1)) + prob(min_h,max_h,h(i,1)));
    end
end

%% v2
m(:,2) = m(:,2)/3;
h(:,2) = h(:,2)/10;

for i = 1:290
    if i<100
        %q(i) = 
        
    else
        
    end

end

%%

q = [zeros(1,9) q];

subplot(2,2,1)
plot(l(:,1),l(:,2))
title('low')

subplot(2,2,2)
plot(m(:,1),m(:,2))
title('medium')

subplot(2,2,3)
plot(h(:,1),h(:,2))
title('high')

subplot(2,2,4)
plot(1:299,q(1:299))
title('HDR')
