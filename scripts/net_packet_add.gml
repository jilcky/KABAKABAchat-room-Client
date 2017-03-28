///net_packet_add(data1, [data2], [...])
/*
 * Add data to the packet. Any of these data types can be added:
 * Integer (signed and unsigned), Float, String and Bool.
 * You can mix these data types when calling this script.
 *
 * data: The data to add to the packet
 *
 * Returns: true if the addition succeeded, false otherwise
*/
if(!net_is_server() && !net_is_client())
{
    show_error("Cannot add data to packet. Reason: Server or Client does not exist.", false);
    return false;
}
if(!instance_exists(obj_packet_controller))
{
    show_error("Cannot add data to packet. Reason: Packet Controller does not exist.", false);
    return false;
}

var val, type;
//Look at what data types we have
for(var i = 0; i < argument_count; i ++)
{
    val = argument[i];
    if(is_string(val))
    {
        type = buffer_string;
    }
    else if(val == false || val == true)
    {
        type = buffer_bool;
    }
    else if(round(val) == val) // if int
    {
        if(val >= 0 && val <= 255)
            type = buffer_u8;
        else if(val >= -128 && val < 0)
            type = buffer_s8;
        else if(val >= 0 && val <= 65535)
            type = buffer_u16;
        else if(val >= -32768 && val < 0)
            type = buffer_s16;
        else if(val >= 0 && val <= 4294967295)
            type = buffer_u32;
        else if(val >=  -2147483648 && val <= 2147483647)
            type = buffer_s32;
        else if(val >= -4503599627370496 && val <= 4503599627370495)
            type = buffer_f64;
        else
        {
            show_error("Cannot add data to packet. Reason: Value too big or too small", false);
            return false;
        }
    }
    else //Value is float
    {
        if(val >= -16777216 && val <= 16777216)
            type = buffer_f32;
        else if(val >= -4503599627370496 && val <= 4503599627370495)
            type = buffer_f64;
        else
        {
            show_error("Cannot add data to packet. Reason: Value too big or too small", false);
            return false;
        }
    }
    
    //Add the value and type to the queue
    obj_packet_controller.packetPrefix += string(type) + ":";
    ds_queue_enqueue(obj_packet_controller.dsBuffer, val);
    ds_queue_enqueue(obj_packet_controller.dsBufferType, type);
}
return true;
