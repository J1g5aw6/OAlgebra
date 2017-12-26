module Polynom = struct
        type polynom = float list
        let zero = []
        let x = [0.;1.]

        let rec is_zero p =
                match p with
                |0.::t -> is_zero t
                |[] -> true
                |_ -> false

        let rec add a b =
                match a,b with
                |_,[] -> a
                |[],_ -> b
                |h1::t1,h2::t2 -> (h1+.h2)::(add t1 t2)

        let rec sc_mul s p =
                match s,p with
                |_,[]->[]
                |s,h::t -> (s*.h)::(sc_mul s t)


        let rec mul p q =
                match p,q with
                |[],_->[]
                |_,[]->[]
                |h::t,p -> []

end;;

module type X_int = sig
  val n : int
end;;

module Z_NZ ( N: X_int ) = struct

  let zero = 0
  let is_zero a = if a mod N.n == 0 then true else false
  let add a b = (a+b) mod N.n
  let s_mul s p = (s*p) mod N.n
  let mult s p = s_mul s p

end;;
