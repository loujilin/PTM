function [ maxlevel ] = findmaxlevel( CompleteCell,linetemp )
%FINDMAXLEVEL Summary of this function goes here
%   Detailed explanation goes here
    [~,m]=size(CompleteCell);
    for i=1:m
       if CompleteCell{1,i}{1}==linetemp
          maxlevel=CompleteCell{1,i}{1,10}(1,end);
           return;
       end
    end
    maxlevel=-1;
end
