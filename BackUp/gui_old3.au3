#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>


Example()

Func Example()
	GUICreate("My GUI picture", 798, 620, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; will create a dialog box that when displayed is centered
	Local $idPic = GUICtrlCreatePic(@ScriptDir & "\src\img\fact_guide.jpg", 10, 10, 778, 423)

	GUICtrlCreateLabel('Dentro del arhico CSV tener en cuenta el siguiente orden:', 30, 445, 300, 21)
	GUICtrlCreateLabel('Columna 1: Factura con prefijo  | ', 80, 470, 250, 21)
	GUICtrlCreateLabel('Columna 2: Número DO | ', 242, 470, 150, 21)
	GUICtrlCreateLabel('Columna 3: Pedido No. | ', 363, 470, 150, 21)
	GUICtrlCreateLabel('Columna 4: Jefe de cuenta  | ', 480, 470, 150, 21)
	GUICtrlCreateLabel('Columna 5: Transportista / TMR', 622, 470, 180, 21)






	GUISetState(@SW_SHOW)
	; Loop until the user exits.

     ; Draw line
    _GDIPlus_Startup ()
    $hGraphic = _GDIPlus_GraphicsCreateFromHWND ($hGUI)
    $hPen = _GDIPlus_PenCreate ()
    _GDIPlus_GraphicsDrawLine ($hGraphic, 10, 150, 390, 150, $hPen)
    _GDIPlus_GraphicsDrawLine ($hGraphic, 10, 100, 10, 150, $hPen)
    _GDIPlus_GraphicsDrawLine ($hGraphic, 10, 100, 390, 100, $hPen)
    _GDIPlus_GraphicsDrawLine ($hGraphic, 390, 100, 390, 150, $hPen)



	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
            
    ; Clean up resources
    _GDIPlus_PenDispose ($hPen)
    _GDIPlus_GraphicsDispose ($hGraphic)
    _GDIPlus_ShutDown ()
				ExitLoop

		EndSwitch
	WEnd
	
    ; Clean up resources
    _GDIPlus_PenDispose ($hPen)
    _GDIPlus_GraphicsDispose ($hGraphic)
    _GDIPlus_ShutDown ()
	GUIDelete()
EndFunc   ;==>Example
