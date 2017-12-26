open OUnit;;
open Main;;

module N = struct
  let n = 29
end;;

module Field = Main.Z_NZ(N);;

let test0 test_ctxt = assert_equal 2. (List.hd sp1);;
let test1 test_ctxt = assert_equal true (Polynom.is_zero Polynom.zero);;


let tsuite =
  "tsuite">:::["test_zero">:: test4;
               "test_scmult2">:: test3];;

run_test_tt_main tsuite;;
