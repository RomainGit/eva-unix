/*********************************************************************
**        File : ctrl_graph.h
** Description : handle for graph controls
**      Author : Claude BROUDIN
**     Created : May 03 2003
*********************************************************************/

#define   FACING_ROW 0
#define   LEGENDPOS_ROW 0
#define   WIDTH_ROW 1
#define   HEIGHT_ROW 1
#define   MINWIDTH_ROW 2
#define   TITLE_ROW 3
#define   SUBTITLE_ROW 4
#define   SUBTITLEUNITY_ROW	3
#define   UNITYTYPE_ROW	3
#define   DIMENSION_ROW 5
#define   SINGLECOL_ROW 5
#define   MAXVALUE_ROW 6
#define   MINVALUE_ROW 6
#define   FIRSTVALUE_ROW 7
#define   FACING_COL 0
#define   LEGENDPOS_COL 1
#define   WIDTH_COL 0
#define   HEIGHT_COL 1
#define   MINWIDTH_COL 0
#define   TITLE_COL 0
#define   SUBTITLE_COL 0
#define   SUBTITLEUNITY_COL	1
#define   UNITYTYP_COL	2
#define   DIMENSION_COL 0
#define   SINGLECOL_COL 1
#define   MAXVALUE_COL 0
#define   MINVALUE_COL 1
#define   VALUE_COL 0

/*********************************************************************
** Function : put_html_graphe
** Description : build a html formated graph 
*********************************************************************/
int put_html_graphe(			/* Return 0 on succes, other on error */
	EVA_context *cntxt,		/* in/out : execution context data */
	DynTable *tab			/* in	  : source data */
							/*
							**
							** row[FACING_ROW][FACING_COL]					"V (vertical) or "" (horizontal) by default
							** row[LEGENDPOS_ROW][LEGENDPOS_COL]			legend position : "0", "1", "2" (none, right, below)
							** row[WIDTH_ROW][WIDTH_COL]					graph width (px or % ex: "50%")
							** row[HEIGHT_ROW][HEIGHT_COL]					graph height (px or % ex : "500")
							** row[MINWIDTH_ROW][MINWIDTH_COL]				mini bar graph width in pixel (ex : "5")
							** row[TITLE_ROW][TITLE_COL]					graph title as : "Annual sales"
							** row[SUBTITLE_ROW][SUBTITLE_COL]				subtitle as : "Month"
							** row[SUBTITLE_ROW][SUBTITLE_COL + 1]			subtitle as : "Peter sales"	 used for graph bar tooltips
							** row[SUBTITLE_ROW][SUBTITLE_COL + n]			subtitle as : "Jean sales"
							** row[SUBTITLEUNITY_ROW][SUBTITLEUNITY_COL]	subtitle unity : ex : "Euros" used for graph bar tooltips
							** row[DIMENSION_ROW][DIMENSION_COL]			# of dimensions ( "n" for Peter to Jean sales)
							** row[MAXVALUE_ROW][MAXVALUE_COL]				greatest graph value ex : "6400"
							** row[MINVALUE_ROW][MINVALUE_COL]				littelest graph value ex : "0" 
							**						
							** row[FIRSTVALUE_ROW][VALUE_COL]				Label value	ex : "January"
							** row[FIRSTVALUE_ROW][VALUE_COL + 1]			value for Peter ex:	"5834.23"
							** row[FIRSTVALUE_ROW][VALUE_COL + n]			value for Jean  ex:	"5384.42"								*/
 );




