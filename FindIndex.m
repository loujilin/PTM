function [ jIndex ] = FindIndex( CompleteCell,j )
%FINDINDEX Summary of this function goes here
%   Detailed explanation goes here
    [~,m]=size(CompleteCell);
   if j>m
       t=m;
   else
       t=j;
   end
   for i=t:-1:1  %scan from j to 1,locate the keyindex quickly
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
           jIndex=i;
           return;
       end
   end 
    for i=t+1:m %if the above can't work,locate the keyindex from j+1 to m
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
           jIndex=i;
           return;
       end
    end
    jIndex=-1;

end

