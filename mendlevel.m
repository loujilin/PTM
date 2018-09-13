function [ CompleteCell,SerialNumber ] = mendlevel( CompleteCell,SerialNumber,linetemp,maxlevel)
%MENDLEVEL Summary of this function goes here
%   Detailed explanation goes here
  [~,m]=size(CompleteCell);
    for i=1:m
       if CompleteCell{1,i}{1}==linetemp
               currentlevel=CompleteCell{1,i}{1,10}(1,end);
              for j=currentlevel+1:maxlevel
                    CompleteCell{1,i}{1,10}=[CompleteCell{1,i}{1,10},j];
                    SerialNumber{j,1}=[SerialNumber{j,1},str2double(linetemp)];
                    SerialNumber{j,2}=SerialNumber{j,2}+1;
              end
           return;
       end
    end

    
    

end
