
/*
 * Complex numbers class
 * 'a' value represents real number of complex number
 * 'b' value represents imaginary number of complex number
 * Basic operations (addition, subtraction, multiplication,
 * and division) are provided as well as absolute value.
 */
class Complex {

  float a, b;

  Complex(float a, float b) {
    this.a = a;
    this.b = b;
  }

  Complex add(Complex other) {
    return new Complex(this.a + other.a, this.b + other.b);
  }

  Complex subtract(Complex other) {
    return new Complex(this.a - other.a, this.b - other.b);
  }

  Complex multiply(Complex other) {
    float newA = this.a * other.a - (this.b * other.b);
    float newB = this.a * other.b + (this.b * other.a);
    return new Complex(newA, newB);
  }

  Complex divide(Complex other) {
    Complex conjugate = new Complex(other.a, (-other.b));
    Complex num = this.multiply(conjugate);
    Complex denom = other.multiply(conjugate);
    return new Complex(num.a / denom.a, num.b / denom.a);
  }

  float abs() {
    return (float) Math.sqrt((a * a) + (b * b));
  }
  
  String toString() {
    String operator = " + ";
    float tempB = this.b;
    if (this.b < 0) {
      operator = " - ";
      tempB = -this.b;
    }
    return this.a + operator + tempB + "i";
  }
}
