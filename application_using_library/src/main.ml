let main email () =
  Logs.debug (fun m -> m "I'm hidden unless you enable debug logging");
  Logs.app (
    fun m ->
      m "Hello world, if you made it this far %a is a valid email"
        Mylib.pp email
  );
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

(* Teach cmdliner how to work with Mylib.t values *)
let mylib_converter =
  Arg.conv (Mylib.of_string, Mylib.pp)

let email =
  let doc = "Email address to validate" in
  let docv = "EMAIL" in
  Arg.(required & pos 0 (some mylib_converter) None & info [] ~doc ~docv)

let main_t = Term.(const main $ email $ setup_log)

let () = Term.exit (Term.eval (main_t, Term.info Sys.executable_name))
