#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>


Example()

Func Example()
	Local $hGUI = GUICreate("Actualización de datos", 800, 655, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; will create a dialog box that when displayed is centered
	Local $idPic = GUICtrlCreatePic(@ScriptDir & "\src\img\fact_guide.jpg", 10, 10, 778, 423)
	Local $idPicCSV = GUICtrlCreatePic(@ScriptDir & "\src\img\csv_example.jpg", 50, 470, 697, 56)
	GUICtrlCreateLabel('Dentro del arhico CSV tener en cuenta el siguiente orden:', 30, 445, 300, 21)
	GUISetState(@SW_SHOW)
	
	Local $hInput_FileSelection = GUICtrlCreateInput('', 50, 545, 535, 23)
	Local $hButton_FileSelection = GUICtrlCreateButton('Seleccionar archivo ', 600, 544, 140, 25)
	Local $hButton_Ejecutar = GUICtrlCreateButton('Ejecutar', 305, 585, 190, 27)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				GUIDelete()
				ExitLoop
			Case $hButton_FileSelection
				Local Const $sMessage = "Hold down Ctrl or Shift to choose multiple files."
				Local $sFileOpenDialog = FileOpenDialog($sMessage, @DesktopDir & "\", "CSV (*.csv)", BitOR($FD_FILEMUSTEXIST, $FD_MULTISELECT))
                $sFileOpenDialog
		EndSwitch
	WEnd
	GUIDelete()
	Exit
EndFunc   ;==>Example
