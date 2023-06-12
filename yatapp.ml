exception Invalid_argument of string;;

let file = "yatapp.json";;

let write_to_file (file: string) (text: string) : unit =
  (*
    Check for empty file or text and raise exception,
    or write text to file
  *)
  if String.length(file) <= 0 || String.length(text) <= 0
    then
      raise (Invalid_argument "invalid {file} or {text} argument provided")
    else
      let oc = open_out file in (* create or truncate file, return channel *)
        Printf.fprintf oc "%s\n" text; (* write something *)
        close_out oc;; (* flush and close the channel *)
    
write_to_file file "{}";;