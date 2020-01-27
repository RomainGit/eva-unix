/*********************************************************************
**        File : bkupfile.c
** Description : rename a file with its name & timestamp
**      Author : Alain BOUTE
**     Created : Aug 10 2004
*********************************************************************/
#define STRICT
#define add_sz_str(obj) (obj), sizeof(obj)-1

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char **argv)
{
	char name[4096];
	char *ext = NULL, *c;
	size_t sz;
	struct stat st;
	int b_curdate;
	struct tm *t;
	time_t t0;

	if(argc <= 2 || !strchr("YMDymd", *argv[1]))
	{
		printf("Usage : bkupfile period file\n"
				"Function : Rename file & keep last version in given period\n"
				"Arguments :\n"
				"	period : Y|M|D|y|m|d\n"
				"	file : file or directory to rename\n"
				"Detail :\n"
				"	assume initial name is name.ext\n"
				"	final name depends on period :\n"
				"	Y => name-YYYY.ext\n"
				"	M => name-YYYY-MM.ext\n"
				"	D => name-YYYY-MM-DD.ext\n"
				"	y => name-yyyy.ext\n"
				"	m => name-yyyy-mm.ext\n"
				"	d => name-yyyy-mm-dd.ext\n"
				"	where YYYY-MM-DD is file last modification date\n"
				"	and yyyy-mm-dd is current date\n"
				"Note that if destination file exist, it is overwritten\n");
		return 1;
	}

	/* Get file info - return on error */
	if(stat(argv[2], &st))
	{
		printf("File not found : %s\n", argv[2]);
		return 1;
	}

	/* Search for file extension - return on error */
	for(c = argv[2]; *c; c++) if(*c == '.') ext = c;
	if(ext == argv[2] || c - ext > 4) ext = NULL;
	sz = (ext ? ext : c) - argv[2];
	if(c - argv[2] > sizeof(name) - 14)
	{
		printf("Filename too long (%lu char max)\n", sizeof(name) - 14);
		return 1;
	}

	/* Prepare new name */
	b_curdate = *argv[1] >= 'a' && *argv[1] <= 'z';
	time(&t0);
	t = localtime(b_curdate ? &t0 : &st.st_mtime);
	memcpy(name, argv[2], sz);
	sz += sprintf(name + sz, "-%04d", t->tm_year + 1900);
	if(strchr("mMdD", *argv[1])) sz += sprintf(name + sz, "-%02d", t->tm_mon + 1);
	if(strchr("dD", *argv[1])) sz += sprintf(name + sz, "-%02d", t->tm_mday);
	if(ext)	sprintf(name + sz, "%s", ext);

	/* Rename file */
	remove(name);
	rename(argv[2], name);
	return 0;
}

