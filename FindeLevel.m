function [ r,c ] = FindeLevel( SerialNumber,LineNo )
%FINDELEVEL �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [rc,~]=size(SerialNumber);
    for i=1:rc
        [r1,c]=find(ismember(SerialNumber{i,1},LineNo));
        if isempty(r1)
            continue;
        else
            r=i;
            break;
        end
    end
 
end

