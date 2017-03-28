///net_packet_send_channel(channel, target, [target2], [target3], ...)
/*
 * SERVER ONLY
 *
 * Sends a packet to the target, if it is on that channel
 *
 * channel: The channel that the targets must be on to be able to get the packet.
 *          Can be Net.AllChannels for all channels, or use net_packet_send for 
 *          all channels
 * target:  The target to send to, can be Net.AllClients to send to all clients
 *          on the channel.
 *
 * Returns: true if the sending succeeded, false otherwise.
*/
if(net_is_client())
    return net_packet_send();
if(argument[1] == Net.AllClients)
{
    if(argument[0] == Net.AllChannels)
    {
        return net_packet_send(Net.AllClients);
    }
    else
    {
        with(server)
        {
            net_packet_construct_buffer();
            var ret = true;
            for(var i = 0; i < ds_list_size(sockets); i ++)
            {
                var _socket = sockets[| i];
                var _channel = net_get_channel(_socket);
                if(_channel == argument[0])
                {
                    if(network_send_packet(_socket, buffer, buffer_tell(buffer)) < 0)
                        ret = false;
                }
            }
            return ret;
        }        
    }
}
else
{
    var _channel = net_get_channel(argument[1]);
    if(_channel == argument[0] || argument[0] == Net.AllChannels)
    {
        return net_packet_send(argument[1]);
    }
    return false;
}

