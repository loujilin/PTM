function [ SerialNumber ] = PTM( CompleteCell,SerialNumber,PriOpt,p)
%PTM 此处显示有关此函数的摘要
%   此处显示详细说明

if (nargin<4)
        p=0.05;
end

[r,~]=size(SerialNumber);
%sort the lineno for each line.
for i=1:r
   SerialNumber{i,1}=sort(SerialNumber{i,1}); 
end
for i=r:-1:2%check the every line from the end and the first line is excepted.
    ctemp=SerialNumber{i,2};
    FFrom={};
    AI=[];
    AP=[];
    BI=[];
    BP=[];
    if ctemp>0
        for j=1:ctemp
            jIndex=FindIndex(CompleteCell,SerialNumber{i,1}(1,j));
            LineName=cell2mat(CompleteCell{1,jIndex}(1,3));
            if(strcmp(LineName,'from')==1||strcmp(LineName,'FROM')==1)
               FromLine=str2double(CompleteCell{1,jIndex}(1,7));
               [rF,~]=size(FFrom); 
               k=1;
               while k<=rF
                   if FFrom{k,1}{1,1}==FromLine
                        FFrom{k,1}{1,2}=FFrom{k,1}{1,2}+1;
                        break;
                   end
                   k=k+1;
               end
               if k>rF
                   FFrom{k,1}=cell(1,2);
                   FFrom{k,1}{1,1}=FromLine;
                   FFrom{k,1}{1,2}=1;
               end
            end
        end
        jIndex=FindIndex(CompleteCell,SerialNumber{i,1}(1,1));
%         LineName=cell2mat(CompleteCell{1,jIndex}(1,3));
        [AI,AP,FFrom ]=GetMatrix(CompleteCell,jIndex,FFrom,i,p);%i equals the layer.
         for j=2:ctemp
             jIndex=FindIndex(CompleteCell,SerialNumber{i,1}(1,j));
             [BI,BP,FFrom]=GetMatrix(CompleteCell,jIndex,FFrom,i,p);
            if ~isempty(BI)&&~isempty(BP)
                AI=kron(AI,BI);
                AP=kron(AP,BP);
            end   
        end
    SerialNumber{i,3}=AI;
    SerialNumber{i,4}=AP;
    end


end

end

