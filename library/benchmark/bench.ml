let () =
  ignore (Benchmark.throughput1
            3 ~name:"Mylib.of_string" Mylib.of_string "known@good");
  print_newline ()
