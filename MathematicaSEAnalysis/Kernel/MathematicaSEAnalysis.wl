BeginPackage["MathematicaSEAnalysis`"];

GetXML;
CodeBlockToExpression;

Begin["`Private`"];

Unprotect["MathematicaSEAnalysis`*"];
ClearAll["MathematicaSEAnalysis`*"];
ClearAll["MathematicaSEAnalysis`*`*"];

<<MathematicaSEAnalysis`GetXML`;
<<MathematicaSEAnalysis`CodeBlockToExpression`;

SetAttributes[Evaluate[Names["MathematicaSEAnalysis`*"]], {ReadProtected, Protected}];

End[];
EndPackage[];