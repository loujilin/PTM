function [ maxlevel ] = findmaxlevel( CompleteCell,linetemp )
%FINDMAXLEVEL Summary of this function goes here
%   Detailed explanation goes here
    [~,m]=size(CompleteCell);
    for i=1:m
       if strcmp(CompleteCell{1,i}{1,1},linetemp)==1
          maxlevel=CompleteCell{1,i}{1,10}(1,end);
           return;
       end
    end
    maxlevel=-1;
end

