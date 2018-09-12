Action()
{
	
	lr_start_transaction("roy1_pass");
	lr_user_data_point("mic_recv", 5000);
	lr_user_data_point("HTTP_200", 5);
	lr_error_message("This is error message");
	lr_think_time(5);
	lr_end_transaction("roy1_pass",LR_PASS);

	
	lr_start_transaction("roy1_fail");
	lr_user_data_point("mic_recv", 5000);
	lr_user_data_point("HTTP_200", 5);
	lr_error_message("This is error message");
	lr_think_time(5);
	lr_end_transaction("roy1_fail",LR_FAIL);

	return 0;
}
