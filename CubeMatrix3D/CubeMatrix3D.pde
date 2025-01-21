// 3D cube matrix visualization

int DIM = 21; // Dimension of the matrix
float boxSize = 100; // Size of each box
float boxDistance = 10; // Distance between boxes
float[][] matrix = new float[DIM][DIM]; // Matrix to hold the wave values
float noise = 3; // Noise factor for randomness in Z values

void setup() {
  size(720, 720, P3D); // Set the size of the window and enable 3D rendering
  randomSeed(0); // Seed for random number generation
  frameRate(15); // Set the frame rate
  initializeMatrix(); // Initialize the matrix with wave values
}

void draw() {
  background(120); // Set the background color
  lights(); // Enable default lighting
  stroke(255); // Set the stroke color for the boxes

  // Set initial translation and rotation for the 3D view
  translate(-width / 4, height, -height * 1.5);
  rotateX(PI / 3);
  rotateZ(-PI / 6);

  // Draw the 3D matrix of boxes
  for (int i = 0; i < DIM; i++) {
    pushMatrix(); // Save the current transformation matrix
    translate(0, -(boxSize + boxDistance) * (i + 1), 0); // Translate for each row
    for (int j = 0; j < DIM; j++) {
      pushMatrix(); // Save the current transformation matrix
      translate((boxSize + boxDistance) * (j + 1), 0, 0); // Translate for each column
      translate(0, 0, getZValue(i, j)); // Translate based on the Z value
      box(boxSize); // Draw the box
      popMatrix(); // Restore the previous transformation matrix
    }
    popMatrix(); // Restore the previous transformation matrix
  }

  updateMatrix(); // Update the matrix values for the wave effect
  // stampaMatrice(); // Uncomment to print the matrix values
}

// Calculate the Z value for the box at position (i, j)
float getZValue(int i, int j) {
  return sin(matrix[i][j] / 2) * 45 + random(-noise, noise); // Calculate Z value with noise
}

// Update the matrix values for the wave effect
void updateMatrix() {
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      matrix[i][j] += 0.5; // Increment the matrix value
      if (matrix[i][j] > 10 * PI) { // Reset if it exceeds a threshold
        matrix[i][j] = 0;
      }
    }
  }
}

// Initialize the matrix with concentric wave values
void initializeMatrix2() {
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      matrix[i][j] = min(i, j); // Initialize with minimum distance to the edge
    }
  }
}

// Initialize the matrix with concentric wave values centered at the matrix center
void initializeMatrix() {
  int center = DIM / 2; // Calculate the center of the matrix
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      int distanceToCenter = max(abs(i - center), abs(j - center)); // Calculate distance to center
      matrix[i][j] = distanceToCenter * (PI / 2); // Initialize with distance to center
    }
  }
}

// Print the matrix values to the console
void stampaMatrice() {
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      print(matrix[i][j], " "); // Print each value
    }
    print("\n"); // New line after each row
  }
}
