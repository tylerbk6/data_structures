module type STACK=
sig 
    type stack
    type el (* Type of elements in stack *)
    val empty : unit -> stack (* Create empty stack *)
    val is_empty : stack -> bool
    val pop : stack -> stack option (* Return None if we try to pop empty stack *)
    val push : el -> stack -> stack
    val top : stack -> el option (* Return None if top of empty stack *)
    val size : stack -> int
    val stack2list : stack -> el list
end    


module IntStack : STACK = (* Implementation of Int stack using built-in lists *)
    struct 
        type stack = int list 
        type el = int
        let empty()=[]
        let is_empty s = match s with
        | [] -> true   
        |_-> false 
        let pop s = match s with 
        | [] -> None
        | h :: t -> Some t                    
        let push i s = i::s
        let top s = match s with 
        | [] -> None
        | h :: t -> Some h
        let rec size s = match s with 
        | [] -> 0
        | t::h -> 1 + size h
        let stack2list s = s 


end