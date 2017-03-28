#define net_packet_send
///net_packet_send([target])
/*
 * Sends the created packet to the given target. Only the server needs to specify the
 * target. The client will always send the packet to the server.
 *
 * [target]: The client socket to send the packet to. (Use Net.AllClients for all clients
 *           and Net.RandomClient for a random client)
 *
 * Returns: true if the sending was successful, false otherwise
*/

if(!net_is_server() && !net_is_client())
{
    show_error("Cannot send packet. Reason: Server or Client does not exist", false);
    return false;
}
if(net_is_server())
{
    with(obj_server)
    {
        net_packet_construct_buffer();
        //If we are handling all clients
        if(argument[0] == Net.AllClients)
        {
            //Loop through all clients and send the packet to them
            for(var i = 0; i < ds_list_size(sockets); i ++)
            {
                //network_send_udp(server, "127.0.0.1", 7070, buffer, buffer_tell(buffer));
                network_send_packet(sockets[| i], buffer, buffer_tell(buffer));
            }
        }
        //Client specified
        else
        {
            //network_send_udp(argument[0], "127.0.0.1", 7070, buffer, buffer_tell(buffer));
            network_send_packet(argument[0], buffer, buffer_tell(buffer));
        }
    }
    return true;
}
if(net_is_client())
{
    with(obj_client)
    {
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_string, obj_packet_controller.packetPrefix);
        while(!ds_queue_empty(obj_packet_controller.dsBuffer))
        {
            buffer_write(buffer, ds_queue_dequeue(obj_packet_controller.dsBufferType), ds_queue_dequeue(obj_packet_controller.dsBuffer));
        }
        //network_send_udp(client, "127.0.0.1", 7070, buffer, buffer_tell(buffer));
        network_send_packet(client, buffer, buffer_tell(buffer));
    }
}
return true;

#define net_packet_construct_buffer
///net_packet_construct_buffer()
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_string, obj_packet_controller.packetPrefix);
while(!ds_queue_empty(obj_packet_controller.dsBuffer))
{
    buffer_write(buffer, ds_queue_dequeue(obj_packet_controller.dsBufferType), ds_queue_dequeue(obj_packet_controller.dsBuffer));
}