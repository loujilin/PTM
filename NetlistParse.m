%��·�������
%class(CompleteCell{1,17}{1,7}(1))���鿴��������������
function [CompleteCell,PriOpt]=NetlistParse()
clc;
clear;

ci=0;  %��¼������������Ԫ�صĸ���
ui=0;  %��¼��������������Ԫ�صĸ���
k=0; %ָ��·ԭʼ����˵ĸ���
%��̬����cellԪ��a={},�������ϴ��������Ԥ�ȷ���ʹ�и��ߵļ���Ч�ʡ�
CompleteCell={};   %������������̬����
UnCompleteCell={};  %��������������̬����
PriOpt=zeros();    %�洢��·��ԭʼ����ˣ���̬����
%fidin=fopen('..\netlist\c17_22.txt','r');
%fidin=fopen('..\netlist\74155.isc','r');
fidin=fopen('../netlist/c17.isc','r');
while(~feof(fidin))     %�ж��Ƿ��ļ���β
    tline=fgetl(fidin);   %���ж�ȡ�ļ�
    tline=strtrim(tline);    %ȥ��tline��β�Ķ���ո�
    if(strcmp(tline(1),'*')==1||isempty(tline))   %�ж��ļ��ĵ�һ���ַ�
        continue;
    else
        tline=strtrim(tline);    %ȥ��tline��β�Ķ���ո�
        TempCell=regexpi(tline,'\s+','split');         %�����ַ����ķָ�ո�Ϊ�磩����Сд������
    end
    
    %��Ҫע����洢����˺ŵ���
    if(strcmp(TempCell(1,3),'inpt')==1||strcmp(TempCell(1,3),'INPT')==1)
        [CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin]=GetInpt(TempCell,CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin); %��ȡ��·��Ԫ�����롢�������������Ϣ
    elseif(strcmp(TempCell(1,3),'from')==1||strcmp(TempCell(1,3),'FROM')==1)
        [CompleteCell,UnCompleteCell,ci,ui,k,fidin]=GetFrom(TempCell,CompleteCell,UnCompleteCell,ci,ui,k,fidin);
    else
        [CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin]=GetBasicGates(TempCell,CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin);
    end
end
fclose(fidin);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
