function [ jIndex ] = FindIndex( CompleteCell,j )
%FINDINDEX Summary of this function goes here
%   Detailed explanation goes here
    [~,m]=size(CompleteCell);
    for i=1:m
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
           jIndex=i;
           return;
       end
    end
    jIndex=-1;

end

