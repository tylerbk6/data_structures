module type STACK=
sig 
    type stack
    type el (* Type of elements in stack *)
    val empty : unit -> stack (* Create empty stack *)
    val is_empty : stack -> bool
    val pop : stack -> stack option (* Return None if we try to pop empty stack *)
    val push : stack -> stack
    val top : stack -> el option (* Return None if top of empty stack *)
    val size : stack -> int
    val stack2list : stack -> int list
end    