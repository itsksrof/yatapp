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

(* Read a file and return its content *)
let read_file_to_string (file: string) : string =
  if String.length(file) <= 0
    then
      raise (Invalid_argument "invalid {file} argument provided")
    else
      let ch = open_in_bin file in
      let contents = really_input_string ch (in_channel_length ch) in
      close_in ch;
      contents;;

write_to_file file "{\n}";;
let contents = read_file_to_string file;;
Printf.printf "File content: \n%s\n" contents;;