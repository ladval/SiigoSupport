#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("My GUI picture", 798, 600, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; will create a dialog box that when displayed is centered
	Local $idPic = GUICtrlCreatePic(@ScriptDir & "\src\img\fact_guide.jpg", 10, 10, 778, 423)
	
    GUISetState(@SW_SHOW)



	; Loop until the user exits.
	
    
    While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

		EndSwitch
	WEnd
	
    ; resize the control
	
    GUICtrlSetPos($idPic, 50, 50, 200, 100)
	
    Local $idMsg
	
    ; Loop until the user exits.
	
    While 1
		$idMsg = GUIGetMsg()

		If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
	GUIDelete()
EndFunc   ;==>Example
