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



`Private`PainleveIINegative[3] =`ScaledNegative`ScaledPainleveIINegative;
Begin["`ScaledNegative`"];


\[Theta][\[Lambda]_]:=2/3 I  \[Lambda] (-3+4 \[Lambda]^2) ;

G[k_?EvenQ][s_,x_,z_]:=({
 {1, s[k]Exp[-(-x)^(3/2) \[Theta][z]]},
 {0, 1}
});
G[k_?OddQ][s_,x_,z_]:=({
 {1, 0},
 {s[k]Exp[(-x)^(3/2) \[Theta][z]], 1}
});
DD//Clear;GL[s_,x_,z_]:=({
 {1, 0},
 {s[1]/(1-s[1] s[3]) Exp[(-x)^(3/2) \[Theta][z]], 1}
});
GU[s_,x_,z_]:=({
 {1, s[1]/(1-s[1] s[3]) Exp[-(-x)^(3/2) \[Theta][z]]},
 {0, 1}
});
DD[s_]:=({
 {1-s[1] s[3], 0},
 {0, 1/(1-s[1]s[3])}
});
\[CapitalPhi][s_,z_]:=Parametrix[DD[s],Line[{-1/2,1/2}],z];
\[CapitalPhi]p[s_,z_]:=ParametrixBranch[DD[s],Line[{-1/2,1/2}],z,-2\[Pi]];
\[CapitalPhi]m[s_,z_]:=ParametrixBranch[DD[s],Line[{-1/2,1/2}],z,0];


GRF[_][_?InfinityQ]:=IdentityMatrix[2];
GRF[{x_,s_},6][z_]:=\[CapitalPhi][s,z].G[6][s,x,z].Inverse[\[CapitalPhi][s,z]];
GRF[{x_,s_},1][z_]:=\[CapitalPhi][s,z].G[1][s,x,z].Inverse[\[CapitalPhi][s,z]];
GRF[{x_,s_},2][z_]:=\[CapitalPhi][s,z].G[2][s,x,z].Inverse[GU[s,x,z]].Inverse[\[CapitalPhi][s,z]];
GRF[{x_,s_},5][z_]:=\[CapitalPhi][s,z].Inverse[GL[s,x,z]].Inverse[\[CapitalPhi][s,z]];

GRFC[{x_,s_},1][z_]:=Inverse[GL[s,x,z]].G[6][s,x,z].G[1][s,x,z].Inverse[\[CapitalPhi][s,z]];
GRFC[{x_,s_},2][z_]:=Inverse[GL[s,x,z]].G[6][s,x,z].Inverse[\[CapitalPhi][s,z]];
GRFC[{x_,s_},3][z_]:=Inverse[GL[s,x,z]].Inverse[\[CapitalPhi][s,z]];
GRFC[{x_,s_},4][z_]:=Inverse[\[CapitalPhi]m[s,z]];


GLF[_,_][_?InfinityQ]:=IdentityMatrix[2];
GLF[{x_,s_},2][z_]:=\[CapitalPhi][s,z].GU[s,x,z].Inverse[\[CapitalPhi][s,z]];
GLF[{x_,s_},3][z_]:=\[CapitalPhi][s,z].G[3][s,x,z].Inverse[\[CapitalPhi][s,z]];
GLF[{x_,s_},4][z_]:=\[CapitalPhi][s,z].G[4][s,x,z].Inverse[\[CapitalPhi][s,z]];
GLF[{x_,s_},5][z_]:=\[CapitalPhi][s,z].G[5][s,x,z].GL[s,x,z].Inverse[\[CapitalPhi][s,z]];

GLFC[{x_,s_},1][z_]:=Inverse[\[CapitalPhi]m[s,z]];
GLFC[{x_,s_},2][z_]:=DD[s].GU[s,x,z].Inverse[\[CapitalPhi][s,z]];
GLFC[{x_,s_},3][z_]:=DD[s].GU[s,x,z].G[3][s,x,z].Inverse[\[CapitalPhi][s,z]];
GLFC[{x_,s_},4][z_]:=DD[s].GU[s,x,z].G[3][s,x,z].G[4][s,x,z].Inverse[\[CapitalPhi][s,z]];


rngg={.5,2.3};
rngg25={.5,3.};
n=20;
{scs,gms}={Function[x,({
 {.5, -.5},
 {(-x)^(3/4), -(-x)^(3/4)}
})],({
 {Line[Exp[I \[Pi]/4]rngg], n},
 {Line[Exp[3 I \[Pi]/4]rngg25], n},
 {Line[Exp[-3I \[Pi]/4]rngg25], n},
 {Line[Exp[- I \[Pi]/4]rngg], n},
 {Line[{Exp[3 I \[Pi]/4] ,Exp[ I \[Pi]/4] }rngg[[1]]], n},
 {Line[{Exp[ I \[Pi]/4] ,Exp[ -I \[Pi]/4] }rngg[[1]]], n},
 {Line[{Exp[- I \[Pi]/4] ,Exp[ -3I \[Pi]/4] }rngg[[1]]], n},
 {Line[{Exp[-3 I \[Pi]/4] ,Exp[ 3I \[Pi]/4] }rngg[[1]]], n}
})};
gs[xv_]:=({
 {GRF[xv,1], GLF[xv,4]},
 {GRF[xv,2], GLF[xv,5]},
 {GRF[xv,5], GLF[xv,2]},
 {GRF[xv,6], GLF[xv,3]},
 {GRFC[xv,1], GLFC[xv,4]},
 {GRFC[xv,2], GLFC[xv,3]},
 {GRFC[xv,3], GLFC[xv,2]},
 {GRFC[xv,4], GLFC[xv,1]}
});


slvr//Clear;slvr:=slvr=ScaledRHSolver[{scs,gms}];


ScaledPainleveIINegative[sin_,x_]:=Module[{s},
{s[1],s[2],s[3]}=sin;
{s[4],s[5],s[6]}=-Array[s,3];
-(1/(\[Pi] I)) Sqrt[-x]Total[DomainIntegrate/@slvr[x,gs[{x,s}]]][[1,2]]]


End[]
