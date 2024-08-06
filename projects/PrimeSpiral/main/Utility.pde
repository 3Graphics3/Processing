class Utility
{

  /* Constructor definition */
  public Utility()
  {
  }

  /* Function definition */
  public boolean isPrime(int number)
  {
    var root = sqrt(number);
    var bound = floor(root + 1);
    for (int k = 2; k < bound; k++)
    {
      var isNumberDivisible = (number % k == 0);
      if (isNumberDivisible) return false;
    }

    return true;
  }
}
