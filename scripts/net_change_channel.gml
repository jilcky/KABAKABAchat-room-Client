///net_change_channel(dataList, clientSocket)
/*
 * A script that is executed when the server recieves a "Change Channel" packet.
 *
 * dataList:     The ds_list containing all information about the packet. The first slot
 *               is always the packet identifier ID, the rest is all data that was in the
 *               packet.
 * clientSocket: The client that sent the packet
*/

ds_list_replace(obj_server.channel, ds_list_find_index(obj_server.sockets, argument1), argument0[| 1]);
