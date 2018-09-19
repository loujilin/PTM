function [ CI,CP,FFrom ] = GetMatrix(CompleteCell,jIndex,FFrom,i,p)
%GETMATRIX Summary of this function goes here
%   Detailed explanation goes here
CP=[];
CI=[];%The return matrix could be empty if no need to return anything,or others.
I=[1,0;
   0,1;];
I1=I(:,1);
I2=[0;0];
I3=I(:,2);
IP=[1-p,p;p,1-p];
IP1=IP(:,1);
IP2=[p;p];
IP3=IP(:,2);
[~,existed]=find(ismember(CompleteCell{1,jIndex}{1,10},i-1));
 LineName=cell2mat(CompleteCell{1,jIndex}(1,3));
    if ~isempty(existed)
         CI=I;
         CP=I;
    elseif(strcmp(LineName,'from')==1||strcmp(LineName,'FROM')==1)
        FromLine=str2double(CompleteCell{1,jIndex}(1,7));
           [rF,~]=size(FFrom); 
           if rF<=0
               return;
           end
           k=1;n=2;
           while k<=rF
               if FFrom{k,1}{1,1}==FromLine
                   n=FFrom{k,1}{1,2};
                   if n<=0%skip the other line of the from gate;
                       return;
                   end
                   n=2^n;
                   if n>2
                   CI=[I1,repmat(I2,1,n-2),I3];
                   CP=CI;%ignore the defect of fanout circuit.
                   %CP=[IP1,repmat(IP2,1,n-2),IP3];%ignore the defect of
                   %fanout circuit
                   else
                       CI=I;
                       CP=IP;
                   end
                    FFrom{k,1}{1,2}=0;
                    break;
                end
               k=k+1;
           end     
    else
        IptNum=length(CompleteCell{1,jIndex}{1,7});
        [CI,CP]=PTMSingleGate(p,IptNum,LineName);
    end

end
