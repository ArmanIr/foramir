elseif get_cmd == 'getlink' then
{"export_chat_link", {ca_chat, ca_none}, do_export_chat_link, "export_chat_link\tPrints chat link that can be used to join to chat", NULL},

void do_export_chat_link (struct command *command, int arg_num, struct arg args[], struct in_ev *ev) {
  assert (arg_num == 1);
  if (ev) { ev->refcnt ++; }
  tgl_do_export_chat_link (TLS, args[0].P->id, print_string_gw, ev);
}
patterns = {
    "^!getlink$",
