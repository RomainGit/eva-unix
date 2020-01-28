/*********************************************************************
** ---------------------- Copyright notice ---------------------------
** This source code is part of the EVASoft project
** It is property of Alain Boute Ingenierie - www.abing.fr and is
** distributed under the GNU Public Licence version 2
** Commercial use is submited to licencing - contact eva@abing.fr
** -------------------------------------------------------------------
**        File : file_utils.h
** Description : TAB/RC files handling utilities
**      Author : Eric Méaux
**     Created : June 2016
*********************************************************************/
#ifdef __unix__
#define _A_NORMAL   0x00    /* Normal file.     */
#define _A_RDONLY   0x01    /* Read only file.  */
#define _A_HIDDEN   0x02    /* Hidden file.     */
#define _A_SYSTEM   0x04    /* System file.     */
#define _A_SUBDIR   0x10    /* Subdirectory.    */
#define _A_ARCH     0x20    /* Archive file.    */

/*********************************************************************
** Structure : _finddata_t
** Description : structure use by find_first, findnext and findclose
*********************************************************************/
struct _finddata_t {
    unsigned attrib;
    time_t time_create;
    time_t time_access;
    time_t time_write;
    off_t size;
    char name[260];
};

/*********************************************************************
** Function : _findfirst
** Description : Returns a unique search handle identifying
*********************************************************************/
intptr_t _findfirst(const char* filespec, struct _finddata_t* fileinfo);

/*********************************************************************
** Function : _findnext
** Description : Find the next entry
*********************************************************************/
int _findnext(intptr_t handle, struct _finddata_t* fileinfo);

/*********************************************************************
** Function : _findclose
** Description : Closes the specified search handle
*********************************************************************/
int _findclose(intptr_t handle);

/*********************************************************************
** Function : match_spec
** Description : Matches the regular language accepted by findfirst/findnext
*********************************************************************/
int match_spec(const char* spec, const char* text);

#endif
