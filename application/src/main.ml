let main () =
  Logs.debug (fun m -> m "I'm hidden unless you enable debug logging");
  Logs.app (fun m -> m "Hello world!");
  Logs.warn (fun m -> m "Program is about to exit")

(* Configure logging output and default reporting level *)
let setup_log style_renderer level =
  Fmt_tty.setup_std_outputs ?style_renderer ();
  Logs.set_level level;
  Logs.set_reporter (Logs_fmt.reporter ());
  ()

(* Setup the program's command line parameters and flags *)
open Cmdliner

(* Provide nice command line flags to adjust logging options *)
let setup_log =
  Term.(const setup_log $ Fmt_cli.style_renderer () $ Logs_cli.level ())

let main_t = Term.(const main $ setup_log)

let () = Term.exit (Term.eval (main_t, Term.info Sys.executable_name))
