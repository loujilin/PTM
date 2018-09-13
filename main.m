clear ;
clc;
format long;
[ CompleteCell,SerialNumber,PriOpt,Gate_Sum,Gate_Num,Inpt_Sum,m]=readdata;
[CompleteCell,SerialNumber,PriOpt]=PTMLayer(CompleteCell,SerialNumber,PriOpt,1);
[PTMmatrix]=PTM(CompleteCell,SerialNumber,PriOpt);