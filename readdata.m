function [ CompleteCell,SerialNumber,PriOpt,Gate_Sum,Gate_Num,Inpt_Sum,m ] = readdata(  )
%READDATA �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[CompleteCell,PriOpt]=NetlistParse();
m=length(CompleteCell);
Gate_Num(1,m)=0;
SerialNumber=cell(1,4);
% SerialNumber{1,1}=[];
SerialNumber{1,2}=0;
j=1; k=-1;
for i=1:m                                       
     temp=cell2mat(CompleteCell{1,i}(1,3)); %cell2mat()��cellת����str ��ȡ��·����
     tempno=str2double(cell2mat(CompleteCell{1,i}(1,1)));
     
%      disp(temp)
     switch(temp)
        case{'and','AND','or','OR','nand','NAND','nor','NOR','xor','XOR','xnor','XNOR','not','NOT',}
            Gate_Num(1,i) =j;%���ŵ����Խ��б��
            j = j+1;
        case{'inpt','INPT'}
            Gate_Num(1,i) = k;
            CompleteCell{1,i}(1,10)=num2cell(1);
            SerialNumber{1,1}=[SerialNumber{1,1},tempno];
            SerialNumber{1,2}=SerialNumber{1,2}+1;
            k=k-1;
         case{'from','FROM','buff','BUFF'}
           Gate_Num(1,i) = 0;
     end
 end
Gate_Sum = j-1;
Inpt_Sum=-1*(k+1);
 x=[Gate_Sum,Gate_Num,Inpt_Sum,m];
disp(x);
clear i;
clear j;

end

