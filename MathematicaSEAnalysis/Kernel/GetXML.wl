BeginPackage["MathematicaSEAnalysis`GetXML`", {"MathematicaSEAnalysis`"}];

Begin["`Private`"];

iGetXML = ImportString["<html>" <> # <> "</html>", "XMLObject"] &;

GetXML[body_String] := First @ GetXML[{body}];
GetXML[{}] := {};
GetXML[bodies : {__String}] := Quiet[
	With[
		{fixedBodies = StringReplace[bodies,
			{
				"\[SpaceIndicator]" -> "_",
				"Notebook[{" -> "Notebook[ {",
				"Content-type: application/vnd.wolfram.mathematica" -> "Content-type:application/vnd.wolfram.mathematica"
			}
		]
		},
		If[Length[bodies] > 100,
			ParallelMap[iGetXML, fixedBodies],
			iGetXML /@ fixedBodies
		]
	]
];

End[];


EndPackage[];