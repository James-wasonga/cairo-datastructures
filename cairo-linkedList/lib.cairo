#[derive(Copy, Drop)]
struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>
}

#[derive(Copy, Drop)]
struct LinkedList<T> {
    head: Option<Box<Node<T>>>,
}

trait LinkedListTrait<T> {
    fn new(ref self: LinkedList<T>)->LinkedList<T>;
    // fn push(ref self: LinkedList<T>, nodeData: T);
}

impl LinkedListImpl<T, +Copy<T>> of LinkedListTrait<T> {
    fn new(ref self: LinkedList<T>)->LinkedList<T>{
        LinkedList {head: Option::None}
    }

   
}