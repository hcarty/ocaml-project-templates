(* Use sane libraries for string and result handling *)
open Astring
open Rresult

(* Setup logging specific to the context of this module *)
let src = Logs.Src.create "mylib" ~doc:"Mylib is where goodness comes to life"
module Log = (val Logs.src_log src : Logs.LOG)

type t = {
  user : string;
  domain : string;
}

let make ~user ~domain =
  { user; domain }

let of_string s =
  Log.debug (fun m -> m "Parsing %s" s);
  match String.cut ~sep:"@" s with
  | None -> R.error_msgf "%s is not a valid email-ish thing" s
  | Some (user, domain) -> R.ok { user; domain }

let pp fmt t =
  Fmt.pf fmt "%s%@%s" t.user t.domain

let to_string =
  Fmt.to_to_string pp

let equal a b =
  a.user = b.user && a.domain = b.domain
