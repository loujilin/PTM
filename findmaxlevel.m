function [ maxlevel ] = findmaxlevel( CompleteCell,linetemp )
%FINDMAXLEVEL Summary of this function goes here
%   Detailed explanation goes here
%     [~,m]=size(CompleteCell);
%     for i=1:m
%        if strcmp(CompleteCell{1,i}{1,1},linetemp)==1
%           maxlevel=CompleteCell{1,i}{1,10}(1,end);
%            return;
%        end
%     end
%     maxlevel=-1;
    
    [~,m]=size(CompleteCell);
    j=str2double(linetemp);%linetemp is char type.

   if j>m
       t=m;
   else
       t=j;
   end
   for i=t:-1:1  %scan from j to 1,locate the keyindex quickly
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
           maxlevel=CompleteCell{1,i}{1,10}(1,end);
           return;
       end
   end 
   
    for i=t+1:m %if the above can't work,locate the keyindex from j+1 to m
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
           maxlevel=CompleteCell{1,i}{1,10}(1,end);
           return;
       end
    end
    maxlevel=-1;
end

