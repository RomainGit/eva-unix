/*********************************************************************
**        File : ctrl_graph.c
** Description : handling fonctions for graph controls
**      Author : Claude BROUDIN
**     Created : APRIL 28 2003
*********************************************************************/

#include "eva.h"
#include <limits.h>
#include "ctrl_graph.h"


#define TAB_CELL(row, col) tab->cell[DYNTAB_INDEX(tab, row, col)].txt
#define TAB_CELL_DATA(row, col) *(tab->cell[DYNTAB_INDEX(tab, row, col)].txt)
#define LABEL_TO_DRAW(row, col) datatodraw.cell[col + (row * datatodraw.szcols)].txt
#define DEFAULT_DRAW_WIDTH 3
#define DEFAULT_NB_DIM 1
#define DEFAULT_VALUE "Valeur"

/*********************************************************************
** Macro : Miscellaneous definitions for texts and titles
** Description : 
*********************************************************************/
#define	GRAPH_NO_USER	"Aucun utilisateur !"

/*********************************************************************
** Macro : RETRIEVE_TOOLTIP
** Description : Extract values
*********************************************************************/
#define RETRIEVE_TOOLTIP \
	if(nb_dim !=1) \
		DYNBUF_ADD3_CELL(&tooltip, "", tab, SUBTITLE_ROW, j + SUBTITLE_COL + 1, NO_CONV, " = ") \
	DYNBUF_PRINTF(&tooltip, 16, unity_type ? "%.0f" : "%.3f", graph_values[current_row + (nb_rows_value * j)], NO_CONV) \
	if(*tooltip_lbl) DYNBUF_ADD3(&tooltip, " ", tooltip_lbl, 0, NO_CONV, "") \
	if(legend_pos) \
	{ \
		DYNTAB_ADD_CELL(legend, j, 0, tab, SUBTITLE_ROW, j + SUBTITLE_COL + 1) \
		DYNTAB_ADD(legend, j, 1, barcolor, 0, NO_CONV) \
	}

/*********************************************************************
** Macro : graph_color
** Description : Bar graph colors
*********************************************************************/
#define GRAPH_NB_COLOR 28
char *graph_color[] = {	"FF0000", "00D000", "00A0FF", "FFFF00", "DDDDDD", "FF00F0", "00FF00",
						"AFAAA0", "000080", "FF0090", "009000", "B000FF", "FFFC00",	"C0C0C0",
						"E03FF0", "0AA0A0", "FFFF9F", "C0C0FF", "808000", "DDDD00", "0000FF",
						"00FFFF", "FFAAAA", "0AA0A0", "E00000",	"F0F0F0", "FF9A00",	"00808F"};

/*********************************************************************
** Function : read_graph_attributes
** Description : output HTML code for a graph control
*********************************************************************/
#define ERR_FUNCTION "read_graph_attributes"
#define ERR_CLEANUP DYNTAB_FREE(drawvalues); \
					DYNTAB_FREE(displabels); \
					DYNTAB_FREE(idlist); \
					DYNTAB_FREE(iddisplay); \
					DYNTAB_FREE(data); \
					DYNTAB_FREE(legend); \
					DYNTAB_FREE(subtitle); \
					DYNTAB_FREE(type); \
					DYNTAB_FREE(datatodraw); \
					DYNTAB_FREE(graphbound); \
					DYNTAB_FREE(supbound); \
					DYNTAB_FREE(infbound);
int read_graph_attributes(		/* return : 0 on success, other on error */
	EVA_context *cntxt,			/* in/out : execution context data */
	EVA_ctrl *ctrl,				/* in	  : control to handle */
	DynTable *graphdata			/* out	  : data to output in graph */
){
	//EVA_form *form = cntxt->form;
	DynBuffer **html = cntxt->form->html;
	DynTable drawvalues = { 0 };
	DynTable displabels = { 0 };
	DynTable idlist = { 0 };
	DynTable iddisplay = { 0 };
	DynTable data = { 0 };
	DynTable legend = { 0 };
	DynTable subtitle = { 0 };
	DynTable type = { 0 };
	DynTable graphbound = { 0 };
	DynTable supbound = { 0 };
	DynTable infbound = { 0 };
	DynTable datatodraw = { 0 };
	unsigned long i = 0, j = 0;
	unsigned long nb_lbl_p_value = 1;
	

	/* Read graph attributes */

/*

	CTRL_READ_ATTR_TAB(drawvalues, DRAWVALUES);	  
	CTRL_READ_ATTR_TAB(displabels, DISPLAYLABELS); */
	CTRL_READ_ATTR_TAB(legend, GRAPHLEGEND);
	CTRL_READ_ATTR_TAB(subtitle, GRAPHSUBTITLE);
	CTRL_READ_ATTR_TAB(type, GRAPHTYPE);
	CTRL_READ_ATTR_TAB(graphbound, GRAPHBOUND);
	CTRL_READ_ATTR_TAB(supbound, GRAPHSUPBOUND);
	CTRL_READ_ATTR_TAB(infbound, GRAPHINFBOUND);

/*	if(!drawvalues.nbrows) { ERR_CLEANUP; return 1; } */

	/* Get objects ids matching control filter 
	if(ctrl_filter_idobj(cntxt, &idlist, ctrl, NULL, 1, Contain, NULL)) STACK_ERROR(1);

	if(!idlist.nbrows) { ERR_CLEANUP; return 1; } */

	/* Keep only displayed Ids in table of Ids & read their data 
	if(qry_list_data(cntxt, &data, &idlist, &drawvalues)) STACK_ERROR(1);	*/
	
	/* Debug code only to check graph engine */

	if(file_read_tabrc(cntxt, &datatodraw, "../logs/Val_graph.txt") || datatodraw.nbrows < 1)
		 STACK_ERROR(1);

	if(datatodraw.nbcols < 2 || !datatodraw.nbrows) STACK_ERROR(1);

	/* Compute the number of dimensions */
	DYNTAB_SET(graphdata, 6, 0, "DIMENSION")
	DYNTAB_ADD_INT(graphdata, 6, 1, datatodraw.nbcols - 1)

	if(datatodraw.nbcols == 2)
		for(i = 0; i < datatodraw.nbrows; i++)
		{
			DYNTAB_ADD_CELL(&displabels, i, 0, &datatodraw, i, 0)
			DYNTAB_ADD_CELL(&data, i, 0, &datatodraw, i, 1)
		}
	else
	{
		for(i = 0; i < datatodraw.nbcols; i++) 
			DYNTAB_ADD_CELL(&subtitle, 0, i, &datatodraw, 0, i)

		for(i = 1; i < datatodraw.nbrows; i++)
		{
			DYNTAB_ADD_CELL(&displabels, i - 1, 0, &datatodraw, i, 0)

			for(j = 1; j < datatodraw.nbcols; j++)
				DYNTAB_ADD_CELL(&data, i - 1, j - 1, &datatodraw, i, j)
		}
	}

	/* To avoid logsdata output	*/
	cntxt->debug = 0;

	/* End of debug code to check graph engine */
	/*
	if(data.nbrows != displabels.nbrows)
		if(data.nbrows) nb_lbl_p_value = displabels.nbrows / data.nbrows;

	if(nb_lbl_p_value * data.nbrows != displabels.nbrows)  STACK_ERROR(1);
	*/
	
	
	DYNTAB_SET(graphdata, 0, 0, "FACING")
	if(type.nbrows && !dyntab_txt_cmp("Graphe vertical", 0, &type, 0, 0))
		DYNTAB_SET(graphdata, 0, 1, "VERTICAL")
	else DYNTAB_SET(graphdata, 0, 1, "HORIZONTAL")

	DYNTAB_SET(graphdata, 1, 0, "WIDTH")
	DYNTAB_SET(graphdata, 1, 1, "100%")

	DYNTAB_SET(graphdata, 2, 0, "HEIGHT")
	DYNTAB_SET(graphdata, 2, 1, "100%")

	DYNTAB_SET(graphdata, 3, 0, "MIN_WIDTH")
	DYNTAB_SET(graphdata, 3, 1, "3")

	DYNTAB_SET(graphdata, 4, 0, "TITLE")
	if(legend.nbrows) DYNTAB_ADD_CELL(graphdata, 4, 1, &legend, 0, 0)
	else DYNTAB_SET(graphdata, 4, 1, "")

	DYNTAB_SET(graphdata, 5, 0, "SUBTITLE")
	if(subtitle.nbrows && subtitle.nbcols)
		for(i = 0; i < subtitle.nbcols; i++)
			DYNTAB_ADD_CELL(graphdata, 5, i + 1, &subtitle, 0, i)

	else DYNTAB_SET(graphdata, 5, 1, "")
		

	DYNTAB_SET(graphdata, 7, 0, "MAX_VALUE")
	DYNTAB_SET(graphdata, 8, 0, "MIN_VALUE")

	if(graphbound.nbrows == 1 && !strcmp("Automatique", graphbound.cell[0].txt))
	{
		DYNTAB_SET(graphdata, 7, 1, "")
		DYNTAB_SET(graphdata, 8, 1, "")
	}
	else
	{
		if(supbound.nbrows) DYNTAB_ADD_CELL(graphdata, 7, 1, &supbound, 0, 0)
		else DYNTAB_SET(graphdata, 7, 1, "")

		if(infbound.nbrows) DYNTAB_ADD_CELL(graphdata, 8, 1, &infbound, 0, 0)
		else DYNTAB_SET(graphdata, 8, 1, "")
	}

	/*	DYNBUF_ADD_STR(html, GRAPH_HEADER_1)
	DYNBUF_ADD(html, ctrl_width, 0, NO_CONV) */

	/* Add labels & values */
	for(i = 0; i < (data.nbrows ? data.nbrows : 0); i++)
	{
		DYNTAB_ADD_CELL(graphdata, i + 9, 0, &displabels, i, 0)

		for(j = 1; j < data.nbcols + 1; j++)
			DYNTAB_ADD_CELL(graphdata, i + 9, j, &data, i, j - 1)
	}


	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : isnumeric
** Description : check if a string represent a numeric value
*********************************************************************/
#define ERR_FUNCTION "isnumeric"
#define ERR_CLEANUP
int isnumeric(		   /* Return 1 if numeric, 0 if not */
  char *txtnumber	   /* in : text to scan */
){
	char *n = txtnumber;

	if(!txtnumber || !*txtnumber) return 0;

	while(*n && ((size_t)(n - txtnumber) < strlen(txtnumber)))
	{
		if(isdigit(*n)) return 1;
		n++;
	}

	return 0;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_graph_header
** Description : Output a html header for the graph
*********************************************************************/
#define ERR_FUNCTION "put_html_graph_header"
#define ERR_CLEANUP
int put_html_graph_header(		/* Return : 1 on memory error, 0 in other cases */
		EVA_context *cntxt, 	/* in/out : execution context data */
		char *ctrl_width,		/* in : graph control width */
		char *ctrl_height,		/* in : graph control height */
		char *title_bgcolor,	/* in : graph title background color */
		char *title_font,		/* in : graph title font */
		char *title_fontsize,	/* in : graph title font size */
		char *title				/* in : graph title */
){
	DynBuffer **html = cntxt->form->html;

	/* Build the html graph header */
	DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=0 rules=none><tr><td>")

	DYNBUF_ADD3(html, "<table cellspacing=0 cellpadding=0 border=3 rules=none width='"
					  , ctrl_width, 0, NO_CONV, "' height='")

/*	DYNBUF_ADD_STR(html, "<table cellspacing=0 cellpadding=0 border=3 rules=none><tr><td height=10%>"
						 "<table cellspacing=0 cellpadding=0 border=1 width=100% "
						 "rules=none><tr><td align=center")*/

	DYNBUF_ADD3(html, "", ctrl_height, 0, NO_CONV, "'><tr><td height=10%>"
						 "<table cellspacing=0 cellpadding=0 border=1 width=100% "
						 "rules=none><tr><td align=center")

	/* Default title back color, title font, title font size */
	DYNBUF_ADD(html, title_bgcolor, 0, NO_CONV)		  
	DYNBUF_ADD(html, title_font, 0, NO_CONV)		
	DYNBUF_ADD(html, title_fontsize, 0, NO_CONV)	

	if(title)	DYNBUF_ADD(html, title, 0, NO_CONV)
	else		DYNBUF_ADD_STR(html, "Graph")

	/* Close title, draw Head of the graph body */
	DYNBUF_ADD_STR(html, "</font></font></td></tr></table>"
						 "</td></tr><tr><td>"
						 "<font face='Arial'><font size =3>"		  
						 "<table cellspacing=0 cellpadding=0 border=1 "
						 "height='100%' width='100%'")

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

/*********************************************************************
** Function : put_html_graph_bar
** Description : Output a html bar for the graph
*********************************************************************/
#define ERR_FUNCTION "put_html_graph_bar"
#define ERR_CLEANUP
int put_html_graph_bar(						/* Return : 1 on memory error, 0 in other cases */
		EVA_context *cntxt, 				/* in/out : execution context data */
		unsigned long scaled_value,			/* in : bar width in % */
		int horizontal,						/* in : Graph facing */
		char *barcolor,						/* in : bar color */
		char *text							/* in : bar tooltip text */
){
	DynBuffer **html = cntxt->form->html;

	switch(horizontal)
	{
	case 1:
		/* Draw the horizontal bar graph with the scaled_value	*/
		
		DYNBUF_ADD3(html, "<td bgcolor='#", barcolor ? barcolor : "FFFFFF", 0, NO_CONV, "' width='")

		DYNBUF_PRINTF(html, 16, "%u", scaled_value, NO_CONV)
		DYNBUF_ADD3(html, "%'><img src='../img/_eva_nop.gif' width='100%' height='100%' alt='", text, 0, NO_CONV, "'></td>")

		break;

	case 0:
			
		/* Draw a vertical graph cell with the scaled_value */
		DYNBUF_ADD_STR(html, "<tr><td height='")
		DYNBUF_PRINTF(html, 16, "%u", scaled_value, NO_CONV)
		DYNBUF_ADD3(html, "%' bgcolor='#", barcolor, 0, NO_CONV, "'>")
		DYNBUF_ADD3(html, "<img src='../img/_eva_nop.gif' width='100%' height='100%' alt='", text, 0, NO_CONV, "'></td></tr>")

		break;
	}

	RETURN_OK_CLEANUP;
}
#undef ERR_FUNCTION
#undef ERR_CLEANUP


/*********************************************************************
** Function : put_html_graphe
** Description : build a html formated graph 
*********************************************************************/
#define ERR_FUNCTION "put_html_graphe"
#define ERR_CLEANUP	 M_FREE(graph_values); \
					  DYNTAB_FREE(l);
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
** row[SUBTITLE_ROW][SUBTITLE_COL + 1]			subtitle as : "Peter sales"	(bar tooltips for x dimensions)
** row[SUBTITLE_ROW][SUBTITLE_COL + n]			subtitle as : "Jean sales"	(bar tooltips for x dimensions)
** row[SUBTITLEUNITY_ROW][SUBTITLEUNITY_COL]	subtitle unity : ex : "Euros" (bar tooltips for x dimensions)
** row[UNITYTYPE_ROW][UNITYTYP_COL]				subtitle unity type : ex : 0 (double) 1 (integer)
** row[DIMENSION_ROW][DIMENSION_COL]			# of dimensions ( "n" for Peter to Jean sales) 1 
** row[SINGLECOL_ROW][SINGLECOL_COL]			1 for an unique graph color if dimension = 1
** row[MAXVALUE_ROW][MAXVALUE_COL]				greatest graph value ex : "6400"
** row[MINVALUE_ROW][MINVALUE_COL]				littelest graph value ex : "0" 
**						
** row[FIRSTVALUE_ROW][VALUE_COL]				Label value	ex : "January"
** row[FIRSTVALUE_ROW][VALUE_COL + 1]			value for Peter ex:	"5834.23"
** row[FIRSTVALUE_ROW][VALUE_COL + n]			value for Jean  ex:	"5384.42" (for x dimensions)
** row[FIRSTVALUE_ROW + 1][VALUE_COL]				Label value	ex : "January"
** row[FIRSTVALUE_ROW + 1][VALUE_COL + 1]			value for Peter ex:	"5834.23"
** row[FIRSTVALUE_ROW + 1][VALUE_COL + n]			value for Jean  ex:	"5384.42" (for x dimensions)
							*/
 ){
	DynBuffer **html = cntxt->form->html;
	DynTable l = {0}, *legend = &l;
	/*Bound values : The hightest & lowest value to draw in the graph*/
	double max_value = 0, min_value = 0, graph_width = 0;
	double *graph_values = NULL, *total = NULL;
	int maxval = 0, minval = 0, title = 0, titlraw = 0, legend_pos = 0;
	char *subtitle = NULL, *tooltip_lbl = NULL;
	/* Draw the graph horizontaly by default */
	int horizontal = 1;
	/* Total number of values in the graph*/
	unsigned long nb_value = 0, nb_rows_value = 0;
	/* Number of graph dimensions 1 by default */
	unsigned long nb_dim = DEFAULT_NB_DIM;
	unsigned long i = 0, j = 0;
	/* Default values for graph control size */
	char *ctrl_width = "'100%'", *ctrl_height = "'100%'", *hor_graph_height ="'90%'";
	unsigned long draw_width = DEFAULT_DRAW_WIDTH;
	int color_index = 0, unique_color = 0;
	/* Numeric value to draw in the graph */
	double graph_row_value = 0;
	int scaled_value = 0, *html_values = NULL, *html_void = NULL, unity_type = 0;

	 
	if(!*html)	RETURN_ERROR("Pas de buffer html", NULL);

	/* If not enough rows or not 2 cols min in source tab -> exit */
	if(!tab || tab->szrows < FIRSTVALUE_ROW + 1 || tab->szcols < 2 || tab->nbrows < FIRSTVALUE_ROW - 1)
		RETURN_ERROR("Données insuffisantes", NULL);

	nb_rows_value = (tab->nbrows - FIRSTVALUE_ROW);

	/* Read the number of dimensions & verif if matching tab.nbcols */
	nb_dim = strtoul(dyntab_val(tab, DIMENSION_ROW, DIMENSION_COL), NULL, 10);
	if(nb_dim > tab->nbcols) RETURN_ERROR("Erreur nombre de dimensions", NULL);

	/* Read single color for 1 dimension */
	if(nb_dim == 1) unique_color = strtoul(dyntab_val(tab, SINGLECOL_ROW, SINGLECOL_COL), NULL, 10);

	/* Read the graph facing. If the entry dont match "V" then default value = "HORIZONTAL" */
	if(!strcmp("V", dyntab_val(tab, FACING_ROW, FACING_COL)))
	{
		horizontal = 0;
		hor_graph_height = "200";
	}

	legend_pos = strtoul(dyntab_val(tab, LEGENDPOS_ROW, LEGENDPOS_COL), NULL, 10);

	ctrl_width = dyntab_val(tab, WIDTH_ROW, WIDTH_COL);

	ctrl_height = dyntab_val(tab, HEIGHT_ROW, HEIGHT_COL);

	/* Read the minimum value for the graph drawing depth */
	draw_width = strtoul(dyntab_val(tab, MINWIDTH_ROW, MINWIDTH_COL), NULL, 10);

	if(!draw_width || (draw_width == ULONG_MAX)) draw_width = DEFAULT_DRAW_WIDTH;

	subtitle = dyntab_val(tab, SUBTITLE_ROW, SUBTITLE_COL);
	tooltip_lbl = dyntab_val(tab, SUBTITLEUNITY_ROW, SUBTITLEUNITY_COL);
	unity_type = strtoul(dyntab_val(tab, UNITYTYPE_ROW, UNITYTYP_COL), NULL, 10);

	if(!nb_dim || (nb_dim == ULONG_MAX)) nb_dim = DEFAULT_NB_DIM;
		

	max_value = strtod(dyntab_val(tab, MAXVALUE_ROW, MAXVALUE_COL), NULL);
	if(max_value != HUGE_VAL && max_value != -HUGE_VAL)
				maxval = 1;

	min_value = strtod(dyntab_val(tab, MINVALUE_ROW, MINVALUE_COL), NULL);
	if(min_value != HUGE_VAL && min_value != -HUGE_VAL)
				minval = 1;

	M_ALLOC(graph_values, nb_rows_value * nb_dim * sizeof(double));
	/* transformer en C_ALLOC */
	M_ALLOC(html_values, nb_rows_value * nb_dim * sizeof(int));
	M_ALLOC(html_void, sizeof(int) * nb_rows_value);
	M_ALLOC(total, nb_rows_value * sizeof(double));

	/* Search for the max and min entries values */
	for(i = FIRSTVALUE_ROW; i < tab->nbrows; i++)
	{	
		unsigned long current_row = i - FIRSTVALUE_ROW;

		total[current_row] = HUGE_VAL;
		
		for(j = 0; j < nb_dim; j++)
		{
			double find_value;

			/* If valide data != "" */
			if(!TAB_CELL(i, j + 1) || !TAB_CELL_DATA(i, j + 1))
			{
				graph_values[current_row + (nb_rows_value * j)] = HUGE_VAL;
				continue;
			}
				
			//find_value = isnumeric(TAB_CELL(i, j + 1)) ? strtod(TAB_CELL(i, j + 1), NULL) : HUGE_VAL;
			find_value = strtod(TAB_CELL(i, j + 1), NULL);
			graph_values[current_row + (nb_rows_value * j)] = find_value;

			if(find_value == HUGE_VAL || find_value == -HUGE_VAL)
				continue;

			if(nb_dim == 1)	total[current_row] = find_value;
			else if(total[current_row] == HUGE_VAL)						
							 total[current_row] = (find_value < 0) ? -find_value : find_value;
			else total[current_row] += (find_value < 0) ? -find_value : find_value;
		}

		/* Compute the maximum value for this row of data */
		if(total[current_row] == HUGE_VAL)
			continue;

		if(i == FIRSTVALUE_ROW)
			if(maxval && !minval) min_value = max_value;
			else if(minval && !maxval) max_value = min_value;
			else if(!minval && !maxval)
			{
				min_value = total[current_row];
				max_value = total[current_row];
			}
			/* else => maxval && minval */
			else if(max_value < min_value)
			{
				double temp;
				temp = max_value;
				max_value = min_value;
				min_value = temp;
			}

		if(total[current_row] > max_value)
			max_value = total[current_row];
		if(total[current_row] < min_value)
			min_value = total[current_row];

		nb_value += 1;
	}

	/* Difference between min and max value give us the 100% width for the graph */
	if(nb_dim == 1) graph_width = max_value - min_value;
	else
	{
		graph_width = max_value;
		min_value = 0;
	}

	/* Compute % html values corresponding to the values to draw */

	for(i = FIRSTVALUE_ROW; i < tab->nbrows; i++)
	{	
		unsigned long current_row = i - FIRSTVALUE_ROW;
		unsigned long html_total = 0;

		for(j = 0; j < nb_dim; j++)
		{
			/* check if value for label exist */
			graph_row_value = graph_values[current_row + (nb_rows_value * j)];

			if(graph_width != 0 && graph_row_value != HUGE_VAL && graph_row_value != -HUGE_VAL)				
					html_values[current_row + (nb_rows_value * j)] = (int)(100 * (graph_row_value - min_value) / graph_width);
			if(html_values[current_row + (nb_rows_value * j)] < 1) html_values[current_row + (nb_rows_value * j)] = 0;
			
			html_total += html_values[current_row + (nb_rows_value * j)];
		}
		html_void[current_row] = (html_total < 100) ? 100 - html_total : 0;
	}  


	/* Build the html graph header */
	if(put_html_graph_header(cntxt, ctrl_width,	ctrl_height,
							 " bgcolor=#DDDDDD>", "<font face='Arial'>", "<font size=5>",
							 dyntab_val(tab, TITLE_ROW, TITLE_COL))) STACK_ERROR(1);

	/* The user need a horizontal graph */
	if(horizontal)
	{
		DYNBUF_ADD_STR(html, " rules=cols><tr><td align=center width='20%'>"
				"<table cellspacing=0 cellpadding=0 border=1 width='100%' height='100%'>"
				"<tr><td align=center bgcolor='#DDDDDD'>")

		if(*subtitle)	DYNBUF_ADD(html, subtitle, 0, NO_CONV)
		else	DYNBUF_ADD_STR(html, "&nbsp;")

		/* Close subtitle writing both min_value & max_value */
		DYNBUF_ADD_STR(html, "</td></tr></table></td><td>"
			"<table cellspacing=0 cellpadding=0 border=1 width='100%' height='100%'>"
			"<tr><td bgcolor='#DDDDDD'>"
			"<table cellspacing=0 cellpadding=0 border=0 width='100%' height='100%'>"
			"<tr><td align=left>") 

		DYNBUF_PRINTF(html, 16, unity_type ? "%.0f" : "%.3f", min_value, NO_CONV)

		DYNBUF_ADD_STR(html, "</td><td align=right>")
		DYNBUF_PRINTF(html, 16, unity_type ? "%.0f" : "%.3f", max_value, NO_CONV)
		DYNBUF_ADD_STR(html, "</td></tr></table></td></tr></table></td></tr>")

		/* For each graph value, build the corresponding html graph table */
		for(i = FIRSTVALUE_ROW; i < tab->nbrows; i++)
		{
			char *barbgcolor = "FFFFFF", *barcolor = "FF0000", *cell_label = NULL;
			unsigned long current_row = i - FIRSTVALUE_ROW;

			if(nb_dim == 1 && !unique_color) barcolor = graph_color[(color_index == GRAPH_NB_COLOR) ? (color_index = 0) : color_index++];
			else color_index = 0;

			/* Head of the first graph row */
			DYNBUF_ADD_STR(html, "<tr><td><table width='100%' height='100%'><tr>"			 
								 "<td bgcolor=#DDDDDD width='100%' align=center>")

			cell_label = dyntab_val(tab, i, 0);
			if(*cell_label)	DYNBUF_ADD(html, cell_label, 0, NO_CONV)
			else	DYNBUF_ADD_STR(html, "&nbsp;")//DYNBUF_ADD_STR(html, "Labels")

			DYNBUF_ADD3(html, "</td></tr></table></td>\n\t<td><table width=100% height='100%' cellspacing=0 cellpadding=0><tr bgcolor='#", barbgcolor ? barbgcolor : "FFFFFF", 0, NO_CONV, "'>")
			

			/* graph_color[]  color_index */

			for(j = 0; j < nb_dim; j++)
			{
				DynBuffer *tooltip = NULL;

				if(nb_dim != 1) barcolor = graph_color[(color_index == GRAPH_NB_COLOR) ? (color_index = 0) : color_index++];

				/* Search for the value to draw */
				RETRIEVE_TOOLTIP

				if(html_values[current_row + (nb_rows_value * j)])
							put_html_graph_bar(cntxt, html_values[current_row + (nb_rows_value * j)],
												horizontal, barcolor, tooltip->data);


			}
			/* Draw the void part of the graph */

			if(html_void[current_row]) put_html_graph_bar(cntxt, html_void[current_row], 
												horizontal, barbgcolor, "");

			DYNBUF_ADD_STR(html, "</tr></table>\n</td></tr>")
		}

		/* Build the html graph footer */
		DYNBUF_ADD_STR(html, "\n</table>\n</font></font></td></tr></table>")
	}
	/* The user need a vertical graph */
	else
	{
		unsigned long col_width, first_col_width;

		DYNBUF_ADD3(html, " rules=none>\n\t<tr height='", hor_graph_height, 0, NO_CONV,
							"'><td bgcolor=#DDDDDD width='")

		/* Compute the sizes of graph's colomns */
		col_width = 100 / (nb_value + 2);				 
		first_col_width = 100 - (nb_value * col_width);

		DYNBUF_ADD_INT(html, first_col_width)
		DYNBUF_ADD_STR(html, "%' align=center>"
			"<table cellspacing=0 cellpadding=0 border=1 height='100%' width='100%' rules=none>"
			"<tr height='10%'><td align=center>")

		DYNBUF_PRINTF(html, 16, unity_type ? "%.0f" : "%.3f", max_value, NO_CONV)
		DYNBUF_ADD_STR(html, "</td></tr><tr height='80%' width='100%'><td>&nbsp;</td></tr>"
							 "<tr align=bottom><td align=center>")

		DYNBUF_PRINTF(html, 16, unity_type ? "%.0f" : "%.3f", min_value, NO_CONV)
		DYNBUF_ADD_STR(html, "</td></tr></table></td>")

		/* For each graph value, build the corresponding html graph table */
		for(i = FIRSTVALUE_ROW; i < tab->nbrows; i++)
		{
			char *barbgcolor = "FFFFFF", *barcolor = "FF0000";
			unsigned long current_row = i - FIRSTVALUE_ROW;

			if(nb_dim == 1 && !unique_color) barcolor = graph_color[(color_index == GRAPH_NB_COLOR) ? (color_index = 0) : color_index++];
			else color_index = 0;

			/* Head of the first graph col */
			DYNBUF_ADD3_INT(html, "<td width='", col_width, "%' align=center><table width='100%' height='100%' cellspacing=0 cellpadding=0>")

			if(html_void[current_row]) put_html_graph_bar(cntxt, html_void[current_row], 
											horizontal, barbgcolor, "");

			for(j = 0; j < nb_dim; j++)
			{
				DynBuffer *tooltip = NULL;
				
				if(nb_dim != 1) barcolor = graph_color[(color_index == GRAPH_NB_COLOR) ? (color_index = 0) : color_index++];
				
				/* Search for the value to draw */
				RETRIEVE_TOOLTIP

				if(html_values[current_row + (nb_rows_value * j)])
					put_html_graph_bar(cntxt, html_values[current_row + (nb_rows_value * j)],
										horizontal, barcolor, tooltip->data);
			}

			DYNBUF_ADD_STR(html, "\n</table></td>")
		}

		/* Terminate the graph body and Draw the last graph row with label values */
		DYNBUF_ADD3_INT(html, "</tr><tr height='10%'><td bgcolor=#FFFFFF align=center>"
				"<table border=1 width=100% height=100%><tr><td bgcolor=#DDDDDD width='"
				, first_col_width, "%'> ")

		/* If subtitle exist */
		if(*subtitle)	DYNBUF_ADD(html, subtitle, 0, NO_CONV)
		else	DYNBUF_ADD_STR(html, "&nbsp;")//DYNBUF_ADD_STR(html, "Labels")

		DYNBUF_ADD_STR(html, "</td></tr></table></td>\n")

		/* Then the labels */
		for(i = FIRSTVALUE_ROW; i < tab->nbrows; i++)
		{
			/* If label & value exist */
			DYNBUF_ADD3_INT(html, "<td bgcolor=#FFFFFF align=center><table width=100% height=100%><tr><td "
								  " bgcolor=#DDDDDD width='"
								  , col_width, "%'>")

			if(TAB_CELL(i, 0)) DYNBUF_ADD_CELL(html, tab, i, 0, NO_CONV)
			else DYNBUF_ADD_STR(html, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")

			DYNBUF_ADD_STR(html, "</td></tr></table>\n</td>")
		}
		/* Build the html graph footer */
		DYNBUF_ADD_STR(html, "</tr></table>\n</font></font></td></tr></table>")
	}

	if(legend_pos)
	{
		char *pos = (legend_pos == 1) ? "</td><td width='20'>&nbsp;</td><td>" : "</td><tr><td>&nbsp;</td></tr><tr><td>";

		DYNBUF_ADD3(html, "", pos, 0, NO_CONV, "<table cellspacing=0 cellpadding=0 border=1 "
												"height='10%' cols=none ")
		if(legend->nbrows <= 10) DYNBUF_ADD_STR(html, "width='35%'>")
		else					 DYNBUF_ADD_STR(html, "width='75%'>")
		for(i = 0; i < legend->nbrows; i++)
		{  
			char *user_name = dyntab_val(legend, i, 0);
			
			if((legend->nbrows <= 10) || ((legend->nbrows > 10) && !(i & 0x0001)))	DYNBUF_ADD_STR(html, "<tr>")
			DYNBUF_ADD3(html, "<td align=center width='16' bgcolor=#", dyntab_val(legend, i, 1), 0, NO_CONV, ">")

			DYNBUF_ADD3(html, "</td><td align=center><font size='-1'>", *user_name ? user_name : ((legend->nbrows < 2) ? GRAPH_NO_USER : "?"), 0, NO_CONV, "</font></td>")
			if((legend->nbrows <= 10) || ((legend->nbrows > 10) && (i & 0x0001))) DYNBUF_ADD_STR(html, "</tr>")
		}
		
		if(	(legend->nbrows > 2) && (i & 0x0001)) DYNBUF_ADD_STR(html, "<td>&nbsp;</td><td>&nbsp;</td></tr>")

		pos =  (legend_pos == 1) ? "</table></td>" : "</table></td></tr>";
		DYNBUF_ADD(html, pos, 0, NO_CONV)

	}

	/* Build the html control graph footer */
	DYNBUF_ADD_STR(html, "</tr></table>")

	RETURN_OK_CLEANUP;

}
#undef ERR_FUNCTION
#undef ERR_CLEANUP

