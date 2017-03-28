///net_get_channel(clientSocket)
/*
 * Gives the channel that the client with the given clienSocket is currently on.
 *
 * clientSocket: The socket of the client.
 *
 * Returns: The channel that the client is on, or undefined if it was not found.
*/
var _index = ds_list_find_index(obj_server.sockets, argument0);
if(_index == -1)
    return undefined;
return obj_server.channel[| _index];
