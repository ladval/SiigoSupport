#include-once
#include "lib/lib_sql.au3"
;============================================================================================================================
Func _ModuloSQL_SQL_Conn($Close = 0)
;~ {
;~     "conn": {
;~         "instancia": "172.16.10.16\\DBABC21",
;~         "db": "BotAbc",
;~         "user": "Operativo",
;~         "pass": "Repecev2019*"
;~     }
;~ }
;~ Local $sJsonFileSettings = @ScriptDir & "\settings\settings.json"
;~ Local $sJsonSettings = _ReadDataFromFile($sJsonFileSettings)
;~ Local $oJsonSettings = Json_Decode($sJsonSettings)
;~ Local $sInvoiceState = Json_Get($oJsonSettings, ".cenet.invoice_status")
;~ Local $Instancia = Json_Get($oJsonSettings, ".conn.instancia")
;~ Local $BD = Json_Get($oJsonSettings, ".conn.db")
;~ Local $Usuario = Json_Get($oJsonSettings, ".conn.user")
;~ Local $Clave = Json_Get($oJsonSettings, ".conn.pass")
	Local $Instancia = "172.16.10.16\DBABC21"
	Local $BD = "BotAbc"
	Local $Usuario = "Operativo"
	Local $Clave = "Repecev2019*"
	_SQL_RegisterErrorHandler()     ;register the error handler to prevent hard crash on COM error
	$oADODB = _SQL_Startup()
	If $oADODB = $SQL_ERROR Then MsgBox(0 + 16 + 262144, "Error", _SQL_GetErrMsg())
	$iConn = _SQL_Connect(-1, $Instancia, $BD, $Usuario, $Clave)
	If $Close = 1 Then _SQL_Close()
	If $iConn = $SQL_OK Then
		Return $iConn
	Else
		Return $SQL_ERROR
	EndIf
EndFunc   ;==>_ModuloSQL_SQL_Conn
;============================================================================================================================
Func _ModuloSQL_SQL_SELECT($Query)
	_ModuloSQL_SQL_Conn()
	Local $aData = ""
	Local $iRows, $iColumns
	$iRval = _SQL_GetTable2D(-1, $Query, $aData, $iRows, $iColumns)
	If $iRval = $SQL_OK Then
		_SQL_Close()
		Return $aData
	Else
		_SQL_Close()
		Return $iRval
	EndIf
EndFunc   ;==>_ModuloSQL_SQL_SELECT
;~ ;============================================================================================================================
Func _ModuloSQL_SQL_EXEC($Query)
	_ModuloSQL_SQL_Conn()
	Local $aData = ""
	$iCUval = _SQL_Execute(-1, $Query)
	If $iCUval = $SQL_OK Then
		_SQL_Close()
		Return $aData
	Else
		_SQL_Close()
		Return $iCUval
	EndIf
EndFunc   ;==>_ModuloSQL_SQL_EXEC
