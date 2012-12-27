/*
 * =====================================================================================
 *
 *       Filename:  l_link_game.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  05/07/2012 11:24:43 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  jim (xcwen), jim@taomee.com
 *        Company:  taomee
 *
 * =====================================================================================
 */

#include <new>
extern "C"
{
#include <libtaomee/log.h>
#include "../../config.h"
#include "../../game.h"
}
#include "l_link.h"
#include "l_match.h"




static Cmatch* p_Matcher = NULL;

extern "C"
{

void* create_game( game_group_t* grp )
{
	return p_Matcher;
}

int game_init()
{
	if(!p_Matcher)
	{
		p_Matcher = new Cmatch();
	}
	return 0;
}

void game_destroy()
{

}


}
