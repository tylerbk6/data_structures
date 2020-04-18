(* Binary Search Trees are ordered by a key value. To abstract
 over what types can be keys, we want to generalize the ordered 
 property of integers. I will use the idea of a totally ordered set *)

module type ORDERED =
sig 
    type t
    val eq : t -> t -> bool (* equality binary relation *)
    val lt : t -> t -> bool
    val gt : t -> t -> bool
end

(* Our binary search trees will be functors parametrized by the totally ordered type t *)

module BST( Ord : ORDERED ) = struct 
    type key = Ord.t
    type tree = Empty | T of tree * key * tree
    let rec member ( x : key) (t : tree) =  (* is key x in tree T? *)
    match t with 
    | Empty -> false 
    | T (l, k, r ) -> if (x=k) then true else (member x l) || (member x r)
end

(* TODO: other functions such as insert, empty, ... *)
