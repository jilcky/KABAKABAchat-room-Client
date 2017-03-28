///net_packet_destroy()
/*
 * Destroys the currently created packet.
 *
 * Returns: None
*/
if(instance_exists(obj_packet_controller))
{
    with(obj_packet_controller)
    {
        ds_queue_clear(dsBuffer);
        ds_queue_clear(dsBufferType);
        packetPrefix = "";
    }
}
