BeginPackage["MathematicaSEAnalysis`ExtractSymbolsFromExpression`", {"MathematicaSEAnalysis`"}];

Begin["`Private`"];

ExtractSymbolsFromExpression = RightComposition[
	Map[iExtractSymbolsFromExpression],
	Union,
	Flatten
];

SetAttributes[iExtractSymbolsFromExpression, HoldAllComplete];
iExtractSymbolsFromExpression[HoldComplete[body___]] := HoldComplete[body] // RightComposition[
	Map[Hold, #, {-1}, Heads -> True]&,
	First[#, {}]&,
	Level[#, {-2}, Heads -> True]&,
	Select[isHeldBuiltinSymbolQ],
	(toWLSymbolEntity @@@ # )&,
	DeleteDuplicates,
	Cases[Entity[_String, _String]]
];
iExtractSymbolsFromExpression[___] := $Failed;

toWLSymbolEntity = Function[
	symbolName,
	Entity["WolframLanguageSymbol", ToString[Unevaluated[symbolName]]],
	{HoldAll}
];

(isHeldBuiltinSymbolQ[#] = True) & /@ (ToExpression[#, StandardForm, Hold] & /@ Names["System`*"]);

(* Don't count DisableFormatting because every snippet has it to avoid formatting issues *)
isHeldBuiltinSymbolQ[Hold[DisableFormatting]] = False;
isHeldBuiltinSymbolQ[_] := False;

End[];

EndPackage[];
