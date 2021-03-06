function [ CI,CP] = PTMSingleGate(p,IptNum,LineName )
%PTMSINGLEGATE 此处显示有关此函数的摘要
%   此处显示详细说明
%pg=0.05;IptNum=3;LineName="AND";
CI=zeros(2^IptNum,2);
CP=zeros(2^IptNum,2);
    switch(LineName)
        case {'and','AND'}
            for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
                %AND的PTM与ITM 
                if(i==2^IptNum)
                    CP(i,1)=p;
                    CP(i,2)=1-p;
                    CI(i,1)=0;
                    CI(i,2)=1;
                else
                    CP(i,1)=1-p;
                    CP(i,2)=p;
                    CI(i,1)=1;
                    CI(i,2)=0;
                end
            end
        case {'or','OR'}
           for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
    %OR的PTM与ITM
                if(i==1)
                    CP(i,1)=1-p;
                    CP(i,2)=p;
                    CI(i,1)=1;
                    CI(i,2)=0;
                else
                    CP(i,1)=p;
                    CP(i,2)=1-p;
                    CI(i,1)=0;
                    CI(i,2)=1;
                end
           end
        case {'nand','NAND'}
           for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
               %NAND的PTM与ITM
                if(i==2^IptNum)
                    CP(i,1)=1-p;
                    CP(i,2)=p;
                    CI(i,1)=1;
                    CI(i,2)=0;
                else
                    CP(i,1)=p;
                    CP(i,2)=1-p;
                    CI(i,1)=0;
                    CI(i,2)=1;
                end
           end            
        case {'nor','NOR'}
           for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
              %NOR的PTM与ITM
                if(i==1)
                    CP(i,1)=p;
                    CP(i,2)=1-p;
                    CI(i,1)=0;
                    CI(i,2)=1;
                else
                    CP(i,1)=1-p;
                    CP(i,2)=p;
                    CI(i,1)=1;
                    CI(i,2)=0;
                end
           end                
        case {'xor','XOR'}
          for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
            %XOR的PTM与ITM
            if(i==1||i==2^IptNum)
                CP(i,1)=1-p;
                CP(i,2)=p;
                CI(i,1)=1;
                CI(i,2)=0;
            else
                CP(i,1)=p;
                CP(i,2)=1-p;
                CI(i,1)=0;
                CI(i,2)=1;
            end
          end         
        case {'xnor','XNOR'}
          for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
                %XNOR的PTM与ITM
                if(i==1||i==2^IptNum)
                    CP(i,1)=p;
                    CP(i,2)=1-p;
                    CI(i,1)=0;
                    CI(i,2)=1;
                else
                    CP(i,1)=1-p;
                    CP(i,2)=p;
                    CI(i,1)=1;
                    CI(i,2)=0;
                end
          end                 
        case {'not','NOT'}
          for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
            %NOT的PTM与ITM
            CP=[p,1-p
                    1-p,p];
            CI=[0,1
                     1,0];
          end                 
        case  {'buff','BUFF'}
          for i=1:1:2^IptNum  %In this way, the author caculated all the probabilities of all type of gates. Is this necessary?
                %BUFF的PTM与ITM
                CP=[1,0;0,1];
                CI=[1,0;0,1];
          end                 
        otherwise
            CI=[];
            CP=[];

    end

end

