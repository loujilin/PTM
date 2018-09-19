function [ AI,AP ] = CaculatePTM( SerialNumber )
%CACULATEPTM Summary of this function goes here
%   Detailed explanation goes here
[r,~]=size(SerialNumber);
AI=[];
AP=[];
if r>=2 
    AI=SerialNumber{2,3};
    AP=SerialNumber{2,4};
    for i=3:r
        BI=SerialNumber{i,3};
        BP=SerialNumber{i,4};
        AI=AI*BI;
        AP=AP*BP;
        BI=[];
        BP=[];
    end 

end


end

