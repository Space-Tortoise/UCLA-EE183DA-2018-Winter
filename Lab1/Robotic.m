clear all; close all; clc;
t=1000; 
vector=zeros(1,t);
max=0;
index=1;

for i=1:1:t
    j=i;
    count=0;
    while j~=1
if rem(j,2)==0
j=j/2;
else
    j=j*3+1;
end
count=count+1;
    end
vector(i)=count;
if count>max
    max=count;
    index=i; 
end
end


x=1:1:1000;
scatter(x,vector(x),15,'filled')
xlabel('n');
ylabel('Stopping Time');
title('The Stopping Time for Numbers 1 to 1000','FontSize',16);

fprintf('In the range from 1 to 1000\n%d has the longest Collatz sequence, whose stopping time is %d\n', index,max);
