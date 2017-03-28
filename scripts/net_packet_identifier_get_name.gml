///net_packet_identifier_get_name(ID)
/*
 * Gives the name of the PacketIdentifier
 *
 * ID: The ID of the PacketIdentifier
 *
 * Returns: The name of the PacketIdentifier, or undefined if the PacketIdentifier does 
 *          not exist
*/
if(!instance_exists(obj_packet_controller))
{
    return undefined;
}
with(obj_packet_controller)
{
    //If the id is within the range of the grid. Without this check we migh return
    //undefined instead of "".
    if(ds_grid_width(packets) > argument0)
    {
        //We can safely return the name
        return string(ds_grid_get(packets, argument0, 0));
    }
    return undefined;
}
