///net_packet_get_data(buffer)
/*
 * Reads through the buffer and returns the values that the buffer contained in a ds_list.
 * The buffer must come from a packet that has been created by "net_packet_create()".
 *
 * buffer: The buffer to read 
 *
 * Returns: A ds_list containing all data read from the buffer. The first value in the
 *          list will always be the ID of the PacketIdentifier.
*/
buffer_seek(argument0, buffer_seek_start, 0);
var information = buffer_read(argument0, buffer_string);
var count = 0;
//We need prePos because we might have data types that are two digits long.
var prePos = 0;
var contains = ds_list_create();
var list;
var insideList = false;
for(var i = 0; i < string_length(information); i++)
{
    //All data types are separated with ":". 
    //If we are at a separator
    if(string_char_at(information, i + 1) == "[")
    {
        insideList = true;
        list = ds_list_create();
        prePos += 1;
    }
    if(string_char_at(information, i + 1) == "]")
    {
        insideList = false;
        ds_list_add(contains, list);
        var s = "";
        prePos += 1;
    }
    if(string_char_at(information, i + 1) == ":")
    {
        //Get the data type
        var type = string_copy(information, prePos + 1, i - prePos);
        if(count == 0)
        {
            //The first item in the buffer is the packet identifier
            ds_list_add(contains, real(type));
        }
        else
        {
            if(insideList)
                ds_list_add(list, buffer_read(argument0, real(type)));
            else
                ds_list_add(contains, buffer_read(argument0, real(type)));
        }
        prePos = i + 1;
        count += 1;
    }
}
return contains;
