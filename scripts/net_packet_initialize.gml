///net_packet_initialize()
/*
 * Creates all packet identifiers.
 *
 * Returns: None
*/

//net_packet_identifier_create("ShowMessage",-1,-1);
//net_packet_identifier_create("ShowName", 1,-1);
//net_packet_identifier_create("ShowTime",-1,net_GetTime);
net_packet_identifier_create("CPing",-1,-1);
net_packet_identifier_create("SPing",net_GetMessage,-1);

