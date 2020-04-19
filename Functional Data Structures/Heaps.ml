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


(* Implementation 1 : Leftist Heaps *)

module LeftistHeap (Element : ORDERED ): HEAP =
struct 

module Elem = Element

type heap = Empty | T of int * Elem.t * heap * heap (* the integer field stores rank*)
let empty = Empty 
let isEmpty h = h = Empty
let rank = function Empty -> 0 | T(r,_,_,_)-> r
let merge  (* TODO : Implement merge (spine splitting) *)



end