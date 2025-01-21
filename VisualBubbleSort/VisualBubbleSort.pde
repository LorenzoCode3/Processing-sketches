// BubbleSort Visualization

// Array to be sorted
int[] array = new int[18];
int i, j, temp;
boolean stillLoopingJ;

void setup(){
  // Window settings
  size(720, 720);
  frameRate(10);
  
  // Array initialization with random values
  for(int k = 0; k < array.length; k++){
    array[k] = (int)random(0, 400);
  }
  
  // Variables initialization
  i = 0;
  j = 0;
}

void draw(){
  // Looping using if condition and increment to display changes in next draw() call (simulating a for loop)
  if(i < array.length - 1){
    // This variable keeps track of the inner for loop(j), when it stays false it means the inner loop has ended
    stillLoopingJ = false;
    
    // Inner loop for bubble sort
    if(j < array.length - i - 1){
      // Swap if the current element is greater than the next element
      if(array[j] > array[j+1]){
        temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
      stillLoopingJ = true;
      j++;
    }
    
    // If inner loop has ended, move to the next element
    if(stillLoopingJ == false){
      i++;
      j = 0;
    }
    
    // Print the current state of the array
    printState(j);
  }
}

// Prints the scene
void printState(int active){
  background(0);
  
  // Draw rectangles for every array cell
  for(int k = 0; k < array.length; k++){
    // If cell is the active one, make it orange, otherwise white
    if(k == active){
      fill(204, 102, 0);
    }
    else{
      fill(255);
    }
    rect(k*40, height/1.3, 30, -array[k]);
  }
}
