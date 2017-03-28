///net_packet_identifier_get_client_script(ID)
/*
 * Gives the script that the client should execute when recieving a packer with the 
 * PacketIdentifier with the given ID.
 *
 * ID: The ID of the PacketIdentifier.
 *
 * Returns: The script that the client should execute, or -1 if no script should be 
 *          executed or the packet does not exist.
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
        return ds_grid_get(packets, argument0, 1);
    }
    return -1;
}
