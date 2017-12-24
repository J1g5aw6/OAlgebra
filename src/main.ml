module Polynom = struct
        type polynom = float list
        let zero = []
        let x = [1.;0.]

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

        let rec sc_mul s p=
                match s,p with
                |_,[]->[]
                |0.,[] -> zero
                |s,h::t -> (s*.h)::(sc_mul s t)


end;;
