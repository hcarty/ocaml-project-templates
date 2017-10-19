open Rresult

let basic_predefined_checks () =
  let mylib = Alcotest.testable Mylib.pp Mylib.equal in
  let msg = Alcotest.testable R.pp_msg (fun _ _ -> true) in
  Alcotest.(check (result mylib msg)) "Known good"
    (Mylib.of_string "known@good")
    (Ok (Mylib.make ~user:"known" ~domain:"good"));
  Alcotest.(check (result mylib msg)) "Known bad"
    (Mylib.of_string "notgood")
    (Error (`Msg "this content is ignored"));
  ()

let round_trip s =
  match Mylib.of_string s with
  | Error msg -> Alcotest.failf "%s failed to parse: %a" s R.pp_msg msg
  | Ok t -> Alcotest.equal Alcotest.string s (Mylib.to_string t)

let round_trip_random_cases name count () =
  let arbitrary_fake_emails =
    let users = QCheck.printable_string_of_size (QCheck.Gen.int_range 1 10) in
    let domains = QCheck.printable_string_of_size (QCheck.Gen.int_range 1 30) in
    QCheck.pair users domains
    |> QCheck.map (fun (user, domain) -> Fmt.strf "%s%@%s" user domain)
  in
  QCheck.Test.make ~count ~name arbitrary_fake_emails round_trip
  |> QCheck.Test.check_exn

let predefined_tests = [
  "predefined cases", `Quick, basic_predefined_checks
]

let quickcheck_tests = [
  "round-trip", `Quick, round_trip_random_cases "parsing quickcheck" 1_000
]

let () =
  Alcotest.run "mylib" [
    "basic", predefined_tests;
    "quickcheck", quickcheck_tests;
  ]
