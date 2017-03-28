///net_packet_identifier_get_Id(name)
/*
 * Gives the ID of a PacketIdentifier. The ID is 0 -> numberOfIdentifiers - 1.
 *
 * name: The name of the PacketIdentifier.
 *
 * Returns: The ID of the PacketIdentifier, or undefined if the PacketIdenfier with the
 *          name "Name" does not exist.
*/
if(!instance_exists(obj_packet_controller))
{
    return undefined;
}
with(obj_packet_controller)
{
    //Loop through all identifiers and give back the ID with the matching name
    for(var i = 0; i < ds_grid_width(packets); i ++)
    {
        if(ds_grid_get(packets, i, 0) == argument0)
        {
            return i;
        }
    }
    return undefined;
}
