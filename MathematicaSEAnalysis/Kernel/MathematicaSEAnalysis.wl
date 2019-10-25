BeginPackage["MathematicaSEAnalysis`"];

GetXML;

Begin["`Private`"];

Unprotect["MathematicaSEAnalysis`*"];
ClearAll["MathematicaSEAnalysis`*"];
ClearAll["MathematicaSEAnalysis`*`*"];

<<MathematicaSEAnalysis`GetXML`;

SetAttributes[Evaluate[Names["MathematicaSEAnalysis`*"]], {ReadProtected, Protected}];

End[];
EndPackage[];