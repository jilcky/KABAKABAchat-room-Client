///net_shutdown(dataList)
/*
 * A script that is executed when the client recieves a "Shutdown" packet.
 *
 * dataList: The ds_list containing all information about the packet. The first slot
 *           is always the packet identifier ID, the rest is all data that was in the
 *           packet.
*/
var message = ds_list_find_value(argument0, 1);
if(message != "")
    show_message(message);
//We have been told to destroy our socket.
net_client_destroy();
