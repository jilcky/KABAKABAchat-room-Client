///net_packet_addlist(list)
/*
 * Adds a list to the packet. 
 *
 * list: The list to add to the packet
 *
 * Returns: true if the addition succeeded, false otherwise
*/
if(!net_is_server() && !net_is_client())
{
    show_error("Cannot add list to packet. Reason: Server or Client does not exist.", false);
    return false;
}
if(!instance_exists(obj_packet_controller))
{
    show_error("Cannot add list to packet. Reason: Packet Controller does not exist.", false);
    return false;
}
if(!ds_exists(argument0, ds_type_list))
{
    show_error("Cannot add list to packet. Reason: No ds_list with the index " + string(argument0) + " exists.", false);
    return false;
}

var val, type;
obj_packet_controller.packetPrefix += "[";
for(var i = 0; i < ds_list_size(argument0); i ++)
{
    net_packet_add(argument0[| i]);
}
obj_packet_controller.packetPrefix += "]";
return true;
