function [ CompleteCell,SerialNumber,PriOpt] = PTMLayer(  CompleteCell,SerialNumber,PriOpt,istart)
%PTMLAYER �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
m=length(CompleteCell);
Gate_Num(1,m)=0;
[r,c]=size(SerialNumber);
j=1; k=-1;
for i=istart:m
     tempno=str2double(cell2mat(CompleteCell{1,i}(1,1)));
     temp=cell2mat(CompleteCell{1,i}(1,3)); %cell2mat()��cellת����str ��ȡ��·����
     %check wether the state of this gate is labled?
%      if(temp=='inpt'||temp=='INPT')
%          continue;
%      end
     %��Ҫ��������  BUFF��buff
     switch(temp)
        case{'and','AND','or','OR','nand','NAND','nor','NOR','xor','XOR','xnor','XNOR'}
            preline=CompleteCell{1,i}{1,7};
            [~,cg]=size(preline);
            maxlevel=0;maxi=0;temp=0;
            for ig=1:cg%��Ҫ������û�б�ŵ����������Ų�ȫ�����,�Ժ���
                linetemp=preline{1,ig};
                temp=findmaxlevel(CompleteCell,linetemp);
                if temp>maxlevel
                    maxlevel=temp;
                    maxi=ig;
                end
            end
%fix up the missing level for the maxlevel of the line is less than the
%final maxlevel.

            for ig=1:cg%��Ҫ������û�б�ŵ����������Ų�ȫ�����
                if ig~=maxi
                    linetemp=preline{1,ig};
                    %mend the missing level mark;
                    [CompleteCell,SerialNumber]=mendlevel(CompleteCell,SerialNumber,linetemp,maxlevel);
                end
            end
           CompleteCell{1,i}(1,10)=num2cell(maxlevel+1);%identify self.
           if maxlevel+1>r
                SerialNumber{maxlevel+1,1}=[];
                SerialNumber{maxlevel+1,2}=0;
                r=r+1;
            end
            SerialNumber{maxlevel+1,1}=[SerialNumber{maxlevel+1,1},tempno];
            SerialNumber{maxlevel+1,2}=SerialNumber{maxlevel+1,2}+1;
            
            Gate_Num(1,i) =j;%���ŵ����Խ��б��
            j = j+1;
        case{'inpt','INPT'}
             continue;%has been done.
         case{'from','FROM'}
            preline=str2double(CompleteCell{1,i}(1,7));
            [prerow,~]=FindeLevel(SerialNumber,preline);
            if prerow+1>r
                SerialNumber{prerow+1,1}=[];
                SerialNumber{prerow+1,2}=0;
                r=r+1;
            end
            SerialNumber{prerow+1,1}=[SerialNumber{prerow+1,1},tempno];
            
            SerialNumber{prerow+1,2}=SerialNumber{prerow+1,2}+1;
            CompleteCell{1,i}(1,10)=num2cell(prerow+1);
         case{'buff','BUFF','not','NOT'}
             preline=str2double(CompleteCell{1,i}(1,7));
             [prerow,~]=FindeLevel(SerialNumber,preline);
            if prerow+1>r
                SerialNumber{prerow+1,1}=[];
                SerialNumber{prerow+1,2}=0;
                r=r+1;
            end
            SerialNumber{prerow+1,1}=[SerialNumber{prerow+1,1},tempno];
            SerialNumber{prerow+1,2}=SerialNumber{prerow+1,2}+1;
            CompleteCell{1,i}(1,10)=num2cell(prerow+1);
             
     end
 end

end
