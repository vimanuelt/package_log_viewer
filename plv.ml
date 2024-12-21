open GMain
open GObj

(* Function to check if a line contains a substring *)
let contains_substring substring line =
  try
    let _ = Str.search_forward (Str.regexp_string substring) line 0 in
    true
  with Not_found -> false

(* Function to read, filter, and sort log entries *)
let read_and_process_logs log_path =
  let pkg_lines = ref [] in
  let pkg_static_lines = ref [] in
  try
    let chan = open_in log_path in
    try
      while true do
        let line = input_line chan in
        if contains_substring "pkg-static" line then
          pkg_static_lines := line :: !pkg_static_lines
        else if contains_substring "pkg" line then
          pkg_lines := line :: !pkg_lines
      done;
      (* Reverse the sorted lines to display the newest entries first *)
      (List.rev (List.sort compare !pkg_lines), List.rev (List.sort compare !pkg_static_lines))
    with End_of_file ->
      close_in chan;
      (List.rev (List.sort compare !pkg_lines), List.rev (List.sort compare !pkg_static_lines))
  with Sys_error err ->
    Printf.eprintf "Error reading log file: %s\n" err;
    ([], [])

(* Populate a text view with log entries *)
let populate_text_view text_view lines =
  let buffer = text_view#buffer in
  let text = String.concat "\n" lines in
  buffer#set_text text

(* Main application logic *)
let main () =
  let _ = GMain.init () in

  (* Create window *)
  let window = GWindow.window ~width:800 ~height:600 ~title:"Package Log Viewer" () in
  ignore (window#connect#destroy ~callback:Main.quit);

  (* Create notebook for tabs *)
  let notebook = GPack.notebook ~packing:window#add () in

  (* Fetch and process logs *)
  let (pkg_lines, pkg_static_lines) = read_and_process_logs "/var/log/messages" in

  (* Create tabs with scroll bars *)
  let create_scrolled_tab lines tab_label =
    let scroll = GBin.scrolled_window ~hpolicy:`AUTOMATIC ~vpolicy:`AUTOMATIC () in
    let text_view = GText.view ~packing:scroll#add () in
    text_view#set_editable false;
    populate_text_view text_view lines;
    ignore (notebook#append_page ~tab_label:((GMisc.label ~text:tab_label ())#coerce) scroll#coerce)
  in

  create_scrolled_tab pkg_lines "Installed Packages";
  create_scrolled_tab pkg_static_lines "Installed Ports";

  (* Show the window and start the GTK main loop *)
  window#show ();
  Main.main ()

let () = main ()
