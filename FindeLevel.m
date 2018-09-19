function [ r,c ] = FindeLevel( SerialNumber,LineNo )
%FINDELEVEL 此处显示有关此函数的摘要
%   此处显示详细说明
    [rc,~]=size(SerialNumber);
    for i=1:rc
        [r1,c]=find(ismember(SerialNumber{i,1},LineNo));
        if isempty(r1)
            continue;
        else
            r=i;
            break;
        end
    end
 
end

