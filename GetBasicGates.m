%��·��Ԫ��nand����ȡ
function [CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin]=GetBasicGates(TempCell,CompleteCell,UnCompleteCell,PriOpt,ci,ui,k,fidin)

%�жϵ�Ԫ�ĸ�������Ƿ���֪
if(strcmp(TempCell(1,5),'0')==0)
    TempUp=TempCell;
    tm=str2double(cell2mat(TempUp(1,5))); %�õ�Ԫԭʼ����˵ĸ�����cell2mat()��cell��ת�����ַ���
    Ipt=zeros(1,tm);
    tline=fgetl(fidin);   %���ж�ȡ�ļ�
    tline=strtrim(tline); %ȥ��tline��β�Ķ���ո�
    TempCell=regexpi(tline,'\s+','split');
    %����жϸõ�Ԫ��������Ƿ���֪
    for i=1:1:tm
        for j=1:1:ci    %�������������в��Ҽ���
            if(strcmp(TempCell(1,i),CompleteCell{1,j}(1,1))==1)
                Ipt(i)=1;
                break;
            end
        end
        
        if(Ipt(i)==0)   %˵���õ�Ԫ�������δ֪
            break;  
        end
    end
    
    tn=length(find(Ipt));  %find()���ص��Ƿ���������length���ص��������ĳ���
    if(tn<tm)   %˵���õ�Ԫ������˵�ֵδ֪,���������������֮��
        ui=ui+1;
        UnCompleteCell{1,ui}(1,1)=TempUp(1,1);    %��Ԫ����˵��ߺ�
        UnCompleteCell{1,ui}(1,2)=TempUp(1,2);   %����
        UnCompleteCell{1,ui}(1,3)=TempUp(1,3); %��Ԫ����
        UnCompleteCell{1,ui}(1,4)=TempUp(1,4); %ָ��Ԫ����˵ĸ���
        if(strcmp(UnCompleteCell{1,ui}(1,4),'0')==1)
            k=k+1;
            PriOpt(k)=str2double(cell2mat(UnCompleteCell{1,ui}(1,1))); %��ȡ����˵��ߺ�
        end
        UnCompleteCell{1,ui}(1,5)=TempUp(1,5); %ָ��Ԫ����˵ĸ���
        UnCompleteCell{1,ui}(1,6)=cellstr('0'); %ָ�õ�Ԫ������ź�δ֪
        UnCompleteCell{1,ui}(1,7)={TempCell};    %�õ�Ԫ����������˺�
        UnCompleteCell{1,ui}(1,8)={[0,1]}; %ָ�õ�Ԫ���������Ӧ���źŸ���
        UnCompleteCell{1,ci}(1,9)={[0,0]}; %ָ�õ�Ԫ���������Ӧ�������źŸ���
    else     %˵���õ�Ԫ������˵�ֵ����֪
        ci=ci+1;
        CompleteCell{1,ci}(1,1)=TempUp(1,1);    %��Ԫ����˵��ߺ�
        CompleteCell{1,ci}(1,2)=TempUp(1,2);   %����
        CompleteCell{1,ci}(1,3)=TempUp(1,3); %��Ԫ����
        CompleteCell{1,ci}(1,4)=TempUp(1,4); %ָ��Ԫ����˵ĸ�����-1ָ������
        if(strcmp(CompleteCell{1,ci}(1,4),'0')==1)
            k=k+1;
            PriOpt(k)=str2double(cell2mat(CompleteCell{1,ci}(1,1))); %��ȡ����˵��ߺ�
        end
        CompleteCell{1,ci}(1,5)=TempUp(1,5); %ָ��Ԫ����˵ĸ���
        CompleteCell{1,ci}(1,6)=cellstr('1'); %ָ�õ�Ԫ������ź���֪
        %��ȡ����˵��ߺ�       
        CompleteCell{1,ci}(1,7)={TempCell}; %�õ�Ԫ����������˺ţ����ָ�ֵ������ʾԪ����cell
        CompleteCell{1,ci}(1,8)={[0,1]}; %ָ�õ�Ԫ���������Ӧ���źŸ���
        CompleteCell{1,ci}(1,9)={[0,0]}; %ָ�õ�Ԫ���������Ӧ�������źŸ���
    end
end

end