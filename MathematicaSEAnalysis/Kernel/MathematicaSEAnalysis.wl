BeginPackage["MathematicaSEAnalysis`"];

GetXML;
CodeBlockToExpression;
ExtractSymbolsFromExpression;

Begin["`Private`"];

Unprotect["MathematicaSEAnalysis`*"];
ClearAll["MathematicaSEAnalysis`*"];
ClearAll["MathematicaSEAnalysis`*`*"];

<<MathematicaSEAnalysis`GetXML`;
<<MathematicaSEAnalysis`CodeBlockToExpression`;
<<MathematicaSEAnalysis`ExtractSymbolsFromExpression`;

SetAttributes[Evaluate[Names["MathematicaSEAnalysis`*"]], {ReadProtected, Protected}];

End[];
EndPackage[];