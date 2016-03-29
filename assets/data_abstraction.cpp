/* data_abstraction.cpp
 *
 * Abstract data type example using a triangles
 *
 * Andrew DeOrio <awdeorio@umich.edu>
 * 2014-12-04
 */

////////////////////////////////////////////////////////////////////////////////
// Triangle.h
class Triangle {
  //a geometric representation of a triangle

public:
  //Creates a zero size Triangle
  //Note: default constructor is needed for creating arrays
  Triangle();

  //Creates a Triangle with given edge lengths
  //a,b,c must be non-negative and form a triangle
  Triangle(double a_in, double b_in, double c_in);

  //Returns the area
  double area();

  //Prints edge lengths
  void print();

 private:
  //Edges are non-negative and form a triangle
  double a, b, c;
};


////////////////////////////////////////////////////////////////////////////////
// Triangle.cpp
#include <cmath>         //sqrt
#include <iostream>      //cout
#include <cassert>       //assert
using namespace std;

Triangle::Triangle() {
  a = b = c = 0;
}

Triangle::Triangle(double a_in, double b_in, double c_in) {
  a = a_in;
  b = b_in;
  c = c_in;

  // check the representation invariant
  assert
    (
     (a + b > c) && 
     (a + c > b) &&
     (b + c > a)
     );
}

double Triangle::area() {
  double s = (a + b + c) / 2;
  double area = sqrt(s*(s-a)*(s-b)*(s-c));
  return area;
}

void Triangle::print() {
  cout << "a=" << a << " b=" << b << " c=" << c << "\n";
}


////////////////////////////////////////////////////////////////////////////////
// Graphics.cpp
int main() {

  // array of Triangles representing a triangle mesh in computer graphics
  const int SIZE = 3;
  Triangle mesh[SIZE];
  mesh[0] = Triangle(3,4,5);
  mesh[1] = Triangle(1,11,11);
  mesh[2] = Triangle(5,5,5);

  // compute the area of the mesh
  double area = 0;
  for (int i=0; i<SIZE; ++i) {
    area += mesh[i].area();
  }
  cout << "total area = " << area << "\n";  //total area = 22.3196

  return 0;
}
