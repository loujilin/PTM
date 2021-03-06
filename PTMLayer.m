function [ CompleteCell,SerialNumber,PriOpt] = PTMLayer(  CompleteCell,SerialNumber,PriOpt,istart)
%PTMLAYER 此处显示有关此函数的摘要
%   此处显示详细说明
m=length(CompleteCell);
Gate_Num(1,m)=0;
[r,~]=size(SerialNumber);
j=1; 
for i=istart:m
     tempno=str2double(cell2mat(CompleteCell{1,i}(1,1)));
     temp=cell2mat(CompleteCell{1,i}(1,3)); %cell2mat()将cell转化成str 提取电路属性
     %check wether the state of this gate is labled?
%      if(temp=='inpt'||temp=='INPT')
%          continue;
%      end
     %需要处理的门  BUFF，buff
     switch(temp)
        case{'and','AND','or','OR','nand','NAND','nor','NOR','xor','XOR','xnor','XNOR'}
            preline=CompleteCell{1,i}{1,7};
            [~,cg]=size(preline);
            maxlevel=0;maxi=0;tempmax=0;
            for ig=1:cg%需要考虑线没有编号的情况，即编号不全的情况,稍后解决
                linetemp=preline{1,ig};
                tempmax=findmaxlevel(CompleteCell,linetemp);%temp is ambiguity.
                if tempmax>maxlevel
                    maxlevel=tempmax;
                    maxi=ig;
                end
            end
%fix up the missing level for the maxlevel of the line is less than the
%final maxlevel.

            for ig=1:cg%需要考虑线没有编号的情况，即编号不全的情况
                if ig~=maxi%multiple maxlevel should be considered.
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
            
            Gate_Num(1,i) =j;%给门的属性进行编号
            j = j+1;
        case{'inpt','INPT'}
             continue;%has been done.
         case{'from','FROM'}
            preline=str2double(CompleteCell{1,i}{1,7});
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
             preline=str2double(CompleteCell{1,i}{1,7});
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
%mend the output line for different levels
[~,co]=size(PriOpt);
maxlevel=0;maxi=0;tempmax=0;
for i=1:co%find the maxlevel
        linetemp=num2str(PriOpt(1,i));
        tempmax=findmaxlevel(CompleteCell,linetemp);%temp is ambiguity.
        if tempmax>maxlevel
            maxlevel=tempmax;
            maxi=i;
        end
end

for i=1:co%mend the other levels
   if i~=maxi%multiple maxlevel should be considered.
        linetemp=num2str(PriOpt(1,i));
        %mend the missing level mark;
        [CompleteCell,SerialNumber]=mendlevel(CompleteCell,SerialNumber,linetemp,maxlevel);
    end
  
end
end

