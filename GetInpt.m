%��·��Ԫ��inpt����ȡ
function [CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin]=GetInpt(TempCell,CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin)

ci=ci+1;
CompleteCell{1,ci}(1,1)=TempCell(1,1);    %��Ԫ����˵��ߺ�
CompleteCell{1,ci}(1,2)=TempCell(1,2);   %����
CompleteCell{1,ci}(1,3)=cellstr('inpt'); %��Ԫ����,cellstr()�ǽ��ַ�����ת����cell����
CompleteCell{1,ci}(1,4)=TempCell(1,4); %ָ��Ԫ����˵ĸ���

%�ж��Ƿ��·��ԭʼ�����
if(strcmp(CompleteCell{1,ci}(1,4),'0')==1)
    k=k+1;
    PriOpt(k)=str2double(cell2mat(CompleteCell{1,ci}(1,1))); %��ȡ����˵��ߺ�
end
CompleteCell{1,ci}(1,5)=TempCell(1,5); %ָ��Ԫ����˵ĸ���
CompleteCell{1,ci}(1,6)=cellstr('1'); %ָ�õ�Ԫ������ź���֪
CompleteCell{1,ci}(1,7)=TempCell(1,1); %ָ�õ�Ԫ����������˺�
CompleteCell{1,ci}(1,8)={[0,1]}; %ָ�õ�Ԫ���������Ӧ���źŸ���
CompleteCell{1,ci}(1,9)={[0,0]}; %ָ�õ�Ԫ���������Ӧ�������źŸ���

end