vuser_init()
{
    os = (char *) getenv("OS");
    if (os != NULL) {
        // Windows
        scale = 1;
        }
    else {
        // UNIX
        scale = 1000;
    }

    stime = stime/scale;   

	return 0;
}
