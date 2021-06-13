(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



BeginPackage["RiemannHilbert`RandomMatrices`",{"RiemannHilbert`","RiemannHilbert`Common`"}];


RandomSymmetric;
RandomOrthogonal;
RandomHermitian;
HistogramPlot;
MarchenkoPastur;
RandomDisk;

Begin["Private`"];



RandomSymmetric[n_,dist_:NormalDistribution[0,1/Sqrt[2]]]:=RandomVariate[dist,{n,n}]//(#+Transpose[#])/Sqrt[2 n]&;
RandomOrthogonal[n_,dist_:NormalDistribution[0,1/Sqrt[2]]]:=Module[{Q},
Q=RandomVariate[dist,{n,n}]//QRDecomposition//First//Transpose;Q .DiagonalMatrix[RandomChoice[{-1,1},n]]
];
RandomHermitian[n_,dist_:NormalDistribution[0,1/Sqrt[2]]]:=Module[{GG},
(GG=(RandomVariate[dist,{n,n}]+I RandomVariate[dist,{n,n}]);
(GG+ConjugateTranspose[GG])/Sqrt[4 n] )
];
SetAttributes[HistogramPlot,HoldFirst];
HistogramPlot[M_,opts:OptionsPattern[SampleRate->100]]:=Module[{Evs},
Evs=Table[M//Eigenvalues//Re,{k,OptionValue[SampleRate]}];
Show[Histogram[Evs//Flatten,60,"PDF"]]
];
HistogramPlot[M_,dst_,opts:OptionsPattern[{SampleRate->100}~Join~Options[ListLinePlot]]]:=Module[{Evs},
Evs=Table[M//Eigenvalues//Re,{k,OptionValue[SampleRate]}];
Show[Histogram[Evs//Flatten,60,"PDF"],LinePlot[dst//Re,PlotStyle->{DarkRed,Thick}],opts]
];


MarchenkoPastur[\[Sigma]_,\[Lambda]_]:=Module[{\[Lambda]p,\[Lambda]m},
\[Lambda]p=\[Sigma]^2 (1 + Sqrt[\[Lambda]])^2;
\[Lambda]m=\[Sigma]^2 (1- Sqrt[\[Lambda]])^2;SingFun[1/(2 \[Pi]\[NonBreakingSpace]\[Sigma]^2 \[Lambda]) IFun[1/#&,Line[{\[Lambda]m,\[Lambda]p}]]  (\[Lambda]p-\[Lambda]m)/2,{1/2,1/2}]
];
MarchenkoPastur[Line[{a_,b_}]]:=Module[{\[Sigma],\[Lambda]},
Select[(MarchenkoPastur@@#&/@Select[({\[Sigma],\[Lambda]}/.Solve[{b==\[Sigma]^2 (1 + Sqrt[\[Lambda]])^2,
a==\[Sigma]^2 (1- Sqrt[\[Lambda]])^2},{\[Sigma],\[Lambda]}]),First[#]>0&&Last[#]>0&]),DomainIntegrate[#]~NEqual~1&]//First
]


RandomDisk[n_,r_:1]:=Complex@@#&/@(r*Sqrt[RandomReal[1,n]]*Transpose[{Cos[#],Sin[#]}&[RandomReal[2 Pi,n]]])


End[];
EndPackage[];
