///net_client_recieve_packet(buffer)
/* 
 * This script is called by the obj_client when the client 
 * recieves a packet.
 *
 * buffer: The buffer that was recieved from the networking event
 *
 * Returns: none
*/
//Read the arguments
var netBuffer = argument0;
//Get a list filled with the data from the buffer
var data = net_packet_get_data(netBuffer);
var script = net_packet_identifier_get_client_script(ds_list_find_value(data, 0));
if(script != -1)
{
    script_execute(script, data);
}
ds_list_destroy(data);
