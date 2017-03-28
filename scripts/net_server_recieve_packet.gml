///net_server_recieve_packet(buffer, clientSocket)
/*
 * This script is called by the obj_server when the server recieves a packet.
 *
 * buffer:       The buffer that the server recieved.
 * clientSocket: The socket that sent the packet.
 *
 * Returns: none
*/
//Get the data that was send
var netBuffer = argument0;
//Get the client who sent it
var clientSocket = argument1;
//What will this packet contain?
var data = net_packet_get_data(netBuffer);
var script = net_packet_identifier_get_server_script(ds_list_find_value(data, 0));
if(script != -1)
{
    script_execute(script, data, clientSocket);
}
ds_list_destroy(data);
