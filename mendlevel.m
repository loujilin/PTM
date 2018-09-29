function [ CompleteCell,SerialNumber ] = mendlevel( CompleteCell,SerialNumber,linetemp,maxlevel)
%MENDLEVEL Summary of this function goes here
%   Detailed explanation goes here
%   [~,m]=size(CompleteCell);
%     for i=1:m
%        if strcmp(CompleteCell{1,i}{1,1},linetemp)==1
%                currentlevel=CompleteCell{1,i}{1,10}(1,end);
%                if currentlevel==maxlevel %when the currentlevel equals to maxlevel,quits
%                    return;
%                end
%               for j=currentlevel+1:maxlevel
%                     CompleteCell{1,i}{1,10}=[CompleteCell{1,i}{1,10},j];
%                     SerialNumber{j,1}=[SerialNumber{j,1},str2double(linetemp)];
%                     SerialNumber{j,2}=SerialNumber{j,2}+1;
%               end
%            return;
%        end
%     end

    [~,m]=size(CompleteCell);
    j=str2double(linetemp);%linetemp is char type.
   if j>m
       t=m;
   else
       t=j;
   end
   for i=t:-1:1  %scan from j to 1,locate the keyindex quickly
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
               currentlevel=CompleteCell{1,i}{1,10}(1,end);
               if currentlevel==maxlevel %when the currentlevel equals to maxlevel,quits
                   return;
               end
              for k=currentlevel+1:maxlevel
                    CompleteCell{1,i}{1,10}=[CompleteCell{1,i}{1,10},k];
                    SerialNumber{k,1}=[SerialNumber{k,1},str2double(linetemp)];
                    SerialNumber{k,2}=SerialNumber{k,2}+1;
              end
           return;
       end
   end 
    for i=t+1:m %if the above can't work,locate the keyindex from j+1 to m
       if strcmp(CompleteCell{1,i}{1,1},num2str(j))==1
           currentlevel=CompleteCell{1,i}{1,10}(1,end);
           if currentlevel==maxlevel %when the currentlevel equals to maxlevel,quits
               return;
           end
          for k=currentlevel+1:maxlevel
                CompleteCell{1,i}{1,10}=[CompleteCell{1,i}{1,10},k];
                SerialNumber{k,1}=[SerialNumber{k,1},str2double(linetemp)];
                SerialNumber{k,2}=SerialNumber{k,2}+1;
          end
           return;
       end
    end
 
    

end

