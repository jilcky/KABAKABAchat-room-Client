///net_packet_create(packetIdentifierName)
/*
 * Create a new packet with the given string identifier name.
 *
 * packetIdentifierName: The name of the PacketIdentifier, which have been created with
 *                       the script "net_packet_identifier_create()"
 *
 * Returns: true if the creation succeeded, false otherwise
*/

if(!net_is_server() && !net_is_client())
{
    show_error("Cannot create packet. Reason: Server or Client does not exist", false);
    return false;
}
var packetId = net_packet_identifier_get_ID(string(argument0));
if(is_undefined(packetId))
{
    show_error("Cannot create packet. Reason: Packet Identifier " + string(argument0) + " cannot be found.", false);
    return false;
}
if(!instance_exists(obj_packet_controller))
{
    show_error("Cannot create packet. Reason: Packet Controller not initialized.", false);
    return false;
}
//Clear if we are creating a new packet
net_packet_destroy();
obj_packet_controller.packetPrefix = string(packetId) + ":";
return true;
