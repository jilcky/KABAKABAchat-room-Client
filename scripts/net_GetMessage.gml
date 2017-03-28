
var message = ds_list_find_value(argument0, 1);
//if(message != "")
{

var Map = json_decode(message)
//Ping = Map[?'鏃堕棿']-date_current_datetime();
ds_list_add(SList,Map);
 //show_debug_message(string(message));
 //show_debug_message(Ping);
}

