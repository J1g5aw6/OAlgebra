open OUnit;;
open Main;;

module N = struct
  let n = 29
end;;

module Field = Main.Z_NZ(N);;

let test0 test_ctxt = assert_equal (Field.is_zero 29) true;;
let test1 test_ctxt = assert_equal (Field.is_zero 28) false;;


let tsuite =
  "tsuite">:::["test_zero">:: test0;
               "test_nzero">:: test1];;

run_test_tt_main tsuite;;
