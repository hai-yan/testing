Action()
{

	sapgui_open_connection_ex("   /SAP_CODEPAGE=1100  /FULLMENU  calderone.hpeswlab.net 00 /3 /UPDOWNLOAD_CP=2", 
		"calderone", 
		"con[0]");

	sapgui_select_active_connection("con[0]");

	sapgui_select_active_session("ses[0]");

	sapgui_select_active_window("wnd[0]");

	sapgui_window_resize("219", 
		"28", 
		BEGIN_OPTIONAL, 
			"AdditionalInfo=sapgui204", 
		END_OPTIONAL);

	/*Before running script, enter password in place of asterisks in logon function*/

	lr_think_time(13);

	sapgui_logon("qa01", 
		"Bb123456", 
		"800", 
		"EN", 
		BEGIN_OPTIONAL, 
			"AdditionalInfo=sapgui2012", 
		END_OPTIONAL);

	return 0;
}