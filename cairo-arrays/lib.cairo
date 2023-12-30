// mod ownershipTest;
use core::debug::PrintTrait;
use core::option::OptionTrait;
use array::ArrayTrait;


// this is an array data structure 
#[derive(Drop)]
struct ArrayDataStructure {
    // for now we are just limited to u32 data types but we are gonna update it
    // as we clean the code
    data: Array<u32>
}

// all the functions within a data structure 
// are declared within this trait
trait ArrayDataStructureTrait {
    fn new(ref self: ArrayDataStructure);
    fn add_element(ref self: ArrayDataStructure, element: u32);
    fn view_element(self: @ArrayDataStructure, index: u32)->u32;
    fn search(self: @ArrayDataStructure, element: u32) -> u32;
    fn update_element(ref self: ArrayDataStructure, array_index: u32, new_value: u32);
    fn length(self: @ArrayDataStructure, index: u32, new_value: u32) -> usize;
    fn traverse(self: @ArrayDataStructure);
    fn delete_element(ref self: ArrayDataStructure, value: u32);
}


// this part implements all the functions within the trait
impl ArrayDataStructureImpl of ArrayDataStructureTrait {
    fn new(ref self: ArrayDataStructure){
        self.data = ArrayTrait::new();
    }

    // adds element at the begining of the array
    fn add_element(ref self: ArrayDataStructure, element: u32){
        self.data.append(element);
    }

    // views an element at a certain index
    fn view_element(self: @ArrayDataStructure, index: u32) -> u32{
        let element = *self.data.at(index);
        element
    }

    fn search(self: @ArrayDataStructure, element: u32) -> u32{
        let mut index: u32 = 0;
        let myArray = self.data;
        loop{
            if index == myArray.len() {
                break;
            }
            if myArray.at(index) == @element {
                break;
            }
            index+=1;
        };
        return index;
    }

    fn update_element(ref self: ArrayDataStructure, array_index: u32, new_value: u32){
        let mut currentArray = @self.data;
        let mut tempArray = ArrayTrait::<u32>::new();
        let mut index = 0;
        loop {
            if index == currentArray.len() {
                break;
            }
            if index == array_index {
                tempArray.append(new_value);
            }else{
                tempArray.append(*currentArray.at(index));
            }
            index += 1;
        };
        self.data = tempArray;
    }

    fn length(self: @ArrayDataStructure, index: u32, new_value: u32) -> usize {
        self.data.len()
    }

    fn traverse(self: @ArrayDataStructure){
        let mut index = 0;
        loop {
            if index == self.data.len() {
                break;
            }

            let printData = *self.data.at(index);
            printData.print();
            index += 1;
        }
    }

    fn delete_element(ref self: ArrayDataStructure, value: u32){
        let mut currentArray = @self.data;
        let mut tempArray = ArrayTrait::<u32>::new();
        let mut index = 0;
        let mut newIndex = 0;

        loop {
            if index == currentArray.len() {
            break;
        }
        if currentArray.at(index) !=  @value {
            tempArray.append(*currentArray.at(index));
        } 
        index += 1;
        };
        self.data = tempArray;
    }

}

// let us test it out
fn main(){
    let mut a = ArrayDataStructure{data: ArrayTrait::new()};
    a.add_element(1);
    a.add_element(2);
    a.add_element(3);
    a.traverse();
    a.update_element(1, 8);
    a.traverse();
    a.delete_element(1);
    a.traverse();

}