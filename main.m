clear;
clc;
format long;
[ CompleteCell,SerialNumber,PriOpt,Gate_Sum,Gate_Num,Inpt_Sum,m]=readdata;
[CompleteCell,SerialNumber,PriOpt]=PTMLayer(CompleteCell,SerialNumber,PriOpt,1);
[SerialNumber]=PTM(CompleteCell,SerialNumber,PriOpt,0.05);
[ITM,PTM]=CaculatePTM(SerialNumber);
temp=ITM.*PTM;