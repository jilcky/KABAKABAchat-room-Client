///net_packet_identifier_get_server_script(ID)
/*
 * Gives the script that the server should execute when recieving a packet with the 
 * PacketIdentifier with the given ID.
 *
 * ID: The ID of the PacketIdentifier.
 *
 * Returns: The script the server should execute when recieving a packet with the
 *          PacketIdentifier with the given ID, or -1 if no script should be executed or 
 *          if the PacketIdentifier does not exist.
*/
if(!instance_exists(obj_packet_controller))
{
    return -1;
}
with(obj_packet_controller)
{
    //We do this check to avoid returning undefined
    if(ds_grid_width(packets) > argument0)
    {
        return ds_grid_get(packets, argument0, 2);
    }
    return -1;
}
