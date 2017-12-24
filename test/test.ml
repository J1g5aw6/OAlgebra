open OUnit;;
open Main;;

let polynom = Main.Polynom.x;;
let sp = Main.Polynom.sc_mul 2. polynom;;
let sp1 = Main.Polynom.add polynom polynom;;

let test3 test_ctxt = assert_equal 2. (List.hd sp1);;
let test4 test_ctxt = assert_equal true (Polynom.is_zero Polynom.zero);;


let tsuite = 
        "tsuite">:::["test_zero">:: test4;
                        "test_scmult2">:: test3];;

run_test_tt_main tsuite;;
