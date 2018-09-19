%电路各单元的输出
function [R,CompleteCell]=PriOptCalResult()

[CompleteCell,PriOpt]=NetlistParse();
m=length(CompleteCell);
h=0;
Rel={};
TempIpt={};
TempIIpt={};
for i=1:1:m
    temp=cell2mat(CompleteCell{1,i}(1,3));  %cell2matGFCD()将cell转化成str
    IptNum=length(CompleteCell{1,i}{1,7});   %提取该单元的输入端个数，注意cell类型嵌套cell类型元素长度的计算技巧
    switch(temp)
        case {'inpt','INPT'}
            for j=1:1:IptNum
                [PriIpt1,PriIpt2]=SigGenerator();     %原始输入信号
                CompleteCell{1,i}(1,8)={[PriIpt1,PriIpt2]};  %该单元输出端的信号值
                CompleteCell{1,i}(1,9)={[PriIpt1,PriIpt2]};  %该单元输出端的理想信号值
            end
        case {'from','FROM'}
            for j=1:1:m
                if(strcmp(CompleteCell{1,i}(1,7),CompleteCell{1,j}(1,1))==1)
                    CompleteCell{1,i}(1,8)=CompleteCell{1,j}(1,8);
                    CompleteCell{1,i}(1,9)=CompleteCell{1,j}(1,9);
                    break;
                end
            end
        case {'and','AND','or','OR','nand','NAND','nor','NOR','xor','XOR','xnor','XNOR','not','NOT','buff','BUFF'}
            for j=1:1:IptNum  %提取各输入端的输入概率分布，并计算其输出值
                for k=1:1:m
                    if(strcmp(CompleteCell{1,i}{1,7}(1,j),CompleteCell{1,k}(1,1))==1)
                        TempIpt{1,j}=CompleteCell{1,k}(1,8);%TempIpt get the probabilities of all input lines.
                        TempIIpt{1,j}=CompleteCell{1,k}(1,9);
                        break;
                    end
                end
            end
  
            [gPM,gIM]=PTMGateITM(IptNum);    %计算该单元的输出  this function should be caculated only once!
            %The result can be fixed,for the probability of error is fixed
            %and the input lines is 1 or 2.
%             AND
%             OR
%             NAND
%             NOR
%             XOR
%             XNOR
%             NOT
%             BUFF
            GIpt=cell2mat(TempIpt{1,1});
            GIIpt=cell2mat(TempIIpt{1,1});
            for j=2:1:IptNum %Because the input lines is parelle, so the result should be got by kron matrix product.
                GIpt=kron(GIpt,cell2mat(TempIpt{1,j}));  %单元的输入概率分布
                GIIpt=kron(GIIpt,cell2mat(TempIIpt{1,j})); %单元的理想输入概率分布
            end
            if(strcmp(temp,'and')==1||strcmp(temp,'AND')==1)
                PTM=gPM{1,1};
                ITM=gIM{1,1};
            elseif(strcmp(temp,'or')==1||strcmp(temp,'OR')==1)
                PTM=gPM{1,2};
                ITM=gIM{1,2};
            elseif(strcmp(temp,'nand')==1||strcmp(temp,'NAND')==1)
                PTM=gPM{1,3};
                ITM=gIM{1,3};
            elseif(strcmp(temp,'nor')==1||strcmp(temp,'NOR')==1)
                PTM=gPM{1,4};
                ITM=gIM{1,4};
            elseif(strcmp(temp,'xor')==1||strcmp(temp,'XOR')==1)
                PTM=gPM{1,5};
                ITM=gIM{1,5};
            elseif(strcmp(temp,'xnor')==1||strcmp(temp,'XNOR')==1)
                PTM=gPM{1,6};
                ITM=gIM{1,6};
            elseif(strcmp(temp,'not')==1||strcmp(temp,'NOT')==1)
                PTM=gPM{1,7};
                ITM=gIM{1,7};
            elseif(strcmp(temp,'buff')==1||strcmp(temp,'BUFF')==1)
                PTM=gPM{1,8};
                ITM=gIM{1,8};
            else
                disp('Report error');             
            end

            CompleteCell{1,i}(1,8)={GIpt*PTM};  %单元的输出概率分布，将元素转化成cell类型的技巧
            CompleteCell{1,i}(1,9)={GIIpt*ITM};  %单元的理想输出概率分布
            
            if(strcmp(CompleteCell{1,i}(1,4),'0')==1)  %提取电路的原始输出概率分布
                h=h+1;
                Rel(1,h)={cell2mat(CompleteCell{1,i}(1,8)).*cell2mat(CompleteCell{1,i}(1,9))}; %将计算结果存为cell类型
                R(h)=Rel{1,h}(1)+Rel{1,h}(2);
            end            
        otherwise
            disp('XiaoJie');
            continue;
    end
%     %%测试用，分别用于输出电路中各输出端的故障情况与理想情况下的输出
%    cell2mat(CompleteCell{1,i}(1,8))
%     cell2mat(CompleteCell{1,i}(1,9))
end
x=prod(R,2);
disp(x);
end