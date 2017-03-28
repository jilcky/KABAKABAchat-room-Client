///net_packet_identifier_create(name, clientScript, serverScript)
/*
 * Creates a new packet identifier to use for identifying packets.
 * 
 * name: The name of the identifier. Should be unique.
 * clientScript: The script the client should execute when it recieves a packet with this
 *               identifier, or -1 if it should not execute any script.
 * serverScript: The script the server should execute when it recieves a packet with this
 *               identifier, or -1 if it should not execute any script.
 *
 * Returns: None
*/
if(!instance_exists(obj_packet_controller))
{
    instance_create(0, 0, obj_packet_controller);
}
with(obj_packet_controller)
{
    //Resize the grid so that we can fit another Identifier
    ds_grid_resize(packets, ds_grid_width(packets) + 1, ds_grid_height(packets));
    ds_grid_set(packets, ds_grid_width(packets) - 1, 0, argument0);
    ds_grid_set(packets, ds_grid_width(packets) - 1, 1, argument1);
    ds_grid_set(packets, ds_grid_width(packets) - 1, 2, argument2);
}
