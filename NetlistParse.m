%电路网表解析
%class(CompleteCell{1,17}{1,7}(1))：查看变量的数据类型
function [CompleteCell,PriOpt]=NetlistParse()
clc;
clear;

ci=0;  %记录完整性链表中元素的个数
ui=0;  %记录非完整性链表中元素的个数
k=0; %指电路原始输出端的个数
%动态创建cell元组a={},但开销较大。所以最好预先分配使有更高的计算效率。
CompleteCell={};   %完整性链表，动态创建
UnCompleteCell={};  %非完整性链表，动态创建
PriOpt=zeros();    %存储电路的原始输出端，动态创建
%fidin=fopen('..\netlist\c17_22.txt','r');
%fidin=fopen('..\netlist\74155.isc','r');
fidin=fopen('../netlist/c17.isc','r');
while(~feof(fidin))     %判断是否文件结尾
    tline=fgetl(fidin);   %按行读取文件
    tline=strtrim(tline);    %去掉tline首尾的多余空格
    if(strcmp(tline(1),'*')==1||isempty(tline))   %判断文件的第一个字符
        continue;
    else
        tline=strtrim(tline);    %去掉tline首尾的多余空格
        TempCell=regexpi(tline,'\s+','split');         %行中字符串的分割（空格为界），大小写不敏感
    end
    
    %需要注意仅存储输入端号的行
    if(strcmp(TempCell(1,3),'inpt')==1||strcmp(TempCell(1,3),'INPT')==1)
        [CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin]=GetInpt(TempCell,CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin); %提取电路单元的输入、类型与输出等信息
    elseif(strcmp(TempCell(1,3),'from')==1||strcmp(TempCell(1,3),'FROM')==1)
        [CompleteCell,UnCompleteCell,ci,ui,k,fidin]=GetFrom(TempCell,CompleteCell,UnCompleteCell,ci,ui,k,fidin);
    else
        [CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin]=GetBasicGates(TempCell,CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin);
    end
end
fclose(fidin);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
