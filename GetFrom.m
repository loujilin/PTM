%��·��Ԫ��from����ȡ
function [CompleteCell,UnCompleteCell,ci,ui,k,fidin]=GetFrom(TempCell,CompleteCell,UnCompleteCell,ci,ui,k,fidin)

%��ȡ�õ�Ԫ�������Ƿ���֪����Ҫ��ͨ������������ƥ���������ߺ�
flag=0;   %���ڱ�ʶ�����Ƿ���֪
uflag=0;
for i=1:1:ci
   if(strcmp(CompleteCell{1,i}(1,2),TempCell(1,4))==1)%compare and confirm whether the line has a inputline.
       ci=ci+1;
       CompleteCell{1,ci}(1,7)=CompleteCell{1,i}(1,1);  %��ȡ�õ�Ԫ������˺�
       flag=1;   %��ʶ��������֪
       break;
   end
end

%�õ�Ԫ�ĸ�����˺���֪
if(flag==1)
    CompleteCell{1,ci}(1,1)=TempCell(1,1);    %��Ԫ����˵��ߺ�
    CompleteCell{1,ci}(1,2)=TempCell(1,2);   %����
    CompleteCell{1,ci}(1,3)=cellstr('from'); %��Ԫ����
    CompleteCell{1,ci}(1,4)=cellstr('-1'); %ָ��Ԫ����˵ĸ�����-1ָ������
    CompleteCell{1,ci}(1,5)=TempCell(1,4); %ָ��Ԫ����˵�����
    CompleteCell{1,ci}(1,6)=cellstr('1'); %ָ�õ�Ԫ������ź���֪
    CompleteCell{1,ci}(1,8)={[0,1]}; %ָ�õ�Ԫ���������Ӧ���źŸ��� 
    CompleteCell{1,ci}(1,9)={[0,0]}; %ָ�õ�Ԫ���������Ӧ�������źŸ���
else
    %���Ҹõ�Ԫ������˺�
    for i=1:1:ui
        if(strcmp(UnCompleteCell{1,i}(1,2),TempCell(1,4))==1)
            ui=ui+1;
            UnCompleteCell{1,ui}(1,7)=UnCompleteCell{1,i}(1,1);  %��ȡ�õ�Ԫ������˺�
            uflag=1;
            break;
        end        
    end
    
    if(uflag==0)
        ui=ui+1;
        UnCompleteCell{1,ui}(1,7)=cellstr('-1');  %��ȡ�õ�Ԫ������˺�,-1ָ�õ�Ԫ������˺�δ֪
    end

    UnCompleteCell{1,ui}(1,1)=TempCell(1,1);    %��Ԫ����˵��ߺ�
    UnCompleteCell{1,ui}(1,2)=TempCell(1,2);   %����
    UnCompleteCell{1,ui}(1,3)=cellstr('from'); %��Ԫ����
    UnCompleteCell{1,ui}(1,4)=cellstr('-1'); %ָ��Ԫ����˵ĸ�����-1ָ������
    UnCompleteCell{1,ui}(1,5)=TempCell(1,4); %ָ��Ԫ����˵�����
    UnCompleteCell{1,ui}(1,6)=cellstr('0'); %ָ�õ�Ԫ������ź�δ֪
    UnCompleteCell{1,ui}(1,8)={[0,1]}; %ָ�õ�Ԫ���������Ӧ���źŸ���  
    UnCompleteCell{1,ui}(1,9)={[0,0]};
end

end