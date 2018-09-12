Action()
{
	double dataValue=2;
    
	int i;

    for (i=1;i<=1500;i++)
    {
    char *pt = NULL;

    lr_save_int(i, "param"); //????????

    pt = lr_eval_string("{param}");

	lr_user_data_point(pt, i);
    }	
	
    
	lr_start_transaction("trans1");
	lr_think_time(2);
	lr_user_data_point("mic_recv", 100);
	lr_user_data_point("HTTP_200", 1);		
	lr_end_transaction("trans1", LR_PASS);	
	return 0;

}
