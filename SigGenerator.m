%������·ԭʼ����˵��źŷ�����
function [PriIpt1,PriIpt2]=SigGenerator()

p=0;
if(rand()>=p)
    PriIpt1=1;
    PriIpt2=1-PriIpt1;
else
    PriIpt1=0;
    PriIpt2=1-PriIpt1;
end

end