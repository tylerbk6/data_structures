(* As in binary search trees, we would like to implement a 
totally ordered type  *)

module type ORDERED =
sig 
    type t
    val eq : t -> t -> bool (* equality binary relation *)
    val lt : t -> t -> bool
    val gt : t -> t -> bool
end


module type HEAP = 
sig

module Elem : ORDERED
type heap
val empty : heap
val isEmpty : heap -> bool
val insert : Elem.t -> heap -> heap 
val merge : heap -> heap -> heap
val findmin : heap -> Elem.t
val deletemin : heap -> heap

end


(* Implementation 1 : Leftist Heaps 
    This is a heap first introduced by Knuth 
    which takes amortized time O(logn) for any 
    operation. The atomic operation is merge.
*)

module LeftistHeap (Element : ORDERED ): HEAP =
struct 

module Elem = Element

type heap = Empty | T of int * Elem.t * heap * heap (* the integer field stores rank*)
let empty = Empty 
let isEmpty h = h = Empty
let rank = function Empty -> 0 | T(r,_,_,_)-> r
let rec merge h1 h2 = match (h1, h2) with 
|(Empty, h)-> h
|(h, Empty)-> h
|( T(rank1,x,l1,r1),T(rank2,y,l2,r2))-> if (Elem.lt x y || Elem.eq x y) then 
makeHeap(x,l1,merge r1 (T(rank2,y,l2,r2)) ) 
else makeHeap (y, l2, merge (T(rank1,x,l1,r1)) r2 )
and 
makeHeap(x, a, b)= if rank b < rank a then T(rank b +1,x,a,b) else 
T(rank a +1, x, b, a)
let insert x h = merge h (makeHeap(x, Empty, Empty))
let findmin = function Empty -> failwith ("Empty") | T(_,x,_,_)-> x
let deletemin h = match h with |Empty-> failwith"Empty"
|T(_,_,l,r)->merge l r
end