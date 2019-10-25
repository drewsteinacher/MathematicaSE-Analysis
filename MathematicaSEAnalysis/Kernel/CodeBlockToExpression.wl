BeginPackage["MathematicaSEAnalysis`CodeBlockToExpression`", {"MathematicaSEAnalysis`"}];

Begin["`Private`"];

CodeBlockToExpression = RightComposition[
	
	(* Hack to avoid Package["context`"] from crashing the kernel *)
	StringReplace[(before : WordBoundary | "[" | "@") ~~ head : Repeated[LetterCharacter, {StringLength["Package"]}] ~~ after : Shortest["[\"" ~~ __ ~~ "`\"]"] /; (head === "Package") :> before <> "HoldComplete[" <> head <> "]" <> after],
	
	(* Avoid In[]/Out[] pairs being "multiplied" *)
	StringReplace[(close : "]" | ")" | ";") ~~ whitespace : (("\n" ..) ~~ (Whitespace | "")) ~~ (outOpen : "Out[") :> close <> ";" <> whitespace <> outOpen],
	
	(* Safely parse as an expression, avoiding evaluation leaks *)
	Quiet[ToExpression[#, StandardForm, HoldComplete]] &,
	
	(* ToExpression leaves behind multi-argument HoldCompletes, sometimes with Null in the top argument *)
	Replace[hc_HoldComplete :> DeleteCases[hc, Null]],
	
	(* ToExpression sometimes breaks up CompoundExpression when it really shouldn't, so combine them together when possible *)
	ReplaceRepeated[
		{
			
			HoldComplete[
				before___,
				ce1 : CompoundExpression[args1___, Null],
				ce2 : CompoundExpression[args2___, Null],
				after___
			] :> HoldComplete[
				before,
				CompoundExpression[args1, args2, Null],
				after
			],
			HoldComplete[
				CompoundExpression[args1___, Null],
				final : Except[_CompoundExpression]
			] :> HoldComplete[CompoundExpression[args1, final]]
		}
	],
	
	(* Avoid typesetting and dynamic formatting *)
	Map[DisableFormatting]
];

End[];


EndPackage[];