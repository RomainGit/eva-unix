/*********************************************************************
**        File : importv3.c
** Description : EVA version 3 data import utility entry point
**      Author : Alain BOUTE
**     Created : Aug 13 2001
*********************************************************************/
#define STRICT
#define add_sz_str(obj) (obj), sizeof(obj)-1

#include <stdlib.h>
#include <malloc.h>
#include <string.h>
#include <stdio.h>
#include <io.h>

int main()
{
	unsigned long i, nb = 0;
	struct _finddata_t fi[100] = { 0 };
	unsigned long fh = _findfirst("*.c", fi);
	if(fh < 0) return -1;
	do if(stricmp("importv3.c", fi[nb].name)) nb++;
	while(!_findnext(fh, fi + nb));
	_findclose(fh);

	for(i = 0; i < nb; i++)
	{
		FILE *f = fopen(fi[i].name, "rb");
		if(f)
		{
			char *txt = malloc(fi[i].size+1);
			char *t0 = txt;
			fread(txt, fi[i].size, 1, f);
			fclose(f);
			f = fopen(fi[i].name, "wb");
			do
			{
				char *t = strstr(txt, "DynTable ");
				if(t)
				{
					char *t1 = t ? strstr(t, " = { NULL };") : NULL;
					char *t2 = t ? t + strcspn(t, "\n\r") : NULL;
					if(t1 && t1 < t2)
					{
						size_t w = fwrite(txt, t1 - txt, 1, f);
						w = fwrite(add_sz_str(" = { 0 }"), 1, f);
						txt = t1 + 11;
					}
					else
					{
						size_t w = fwrite(txt, t - txt + 1, 1, f);
						txt = t + 1;
					}
				}
				else
				{
					size_t w = fwrite(txt, fi[i].size - (txt - t0), 1, f);
					txt = NULL;
				}
			}
			while(txt);
			fclose(f);
			free(t0);
		}
	}

	return 0;
}

