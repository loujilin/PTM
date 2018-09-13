function [ PTMmatrix ] = PTM( CompleteCell,SerialNumber,PriOpt )
%PTM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% [gIM,gPM]=PTMGateITM(0.05,2);
I=[1,0;
   0,1;];
[r,~]=size(SerialNumber);
%sort the lineno for each line.
for i=1:r
   SerialNumber{i,1}=sort(SerialNumber{i,1}); 
end
for i=r:-1:2%check the every line from the end and the first line is excepted.
    ctemp=SerialNumber{i,2};
    FFrom={};
    if ctemp>0
        [AI,AP]=GetMatrix(CompleteCell,SerialNumber{i,1}(1,1),FFrom,gIM,gPM);
        for j=2:ctemp
            jIndex=FindIndex(CompleteCell,SerialNumber{i,1}(1,j));
            [~,exist]=find(ismember(CompleteCell{1,jIndex}{1,7},i-1));
            if ~isempty(exist)
                BI=I;
                BP=I;
            else
                [BI,BP]=GetMatrix(CompleteCell,SerialNumber{i,1}(1,j),FFrom,gIM,gPM);   
          
            end
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
