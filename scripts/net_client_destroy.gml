///net_client_destroy()
/*
 * Destroys the network socket.
 *
 * Returns: None
*/
if(net_is_client())
{
    with(obj_client)
    {
        network_destroy(client);
        buffer_delete(buffer);
        instance_destroy();
    }
}
