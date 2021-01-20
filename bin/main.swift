//swift 5.1.5

// method generate all prime number less then N in O(n)
func seive(_ isprime:inout [Bool], _ prime:inout [Int], _ SPF:inout [Int], _ N:Int) {

  // 0 and 1 are not prime
  isprime[0] = false;
  isprime[1] = false;

  // Fill rest of the entries

  var i=2;
  while i < N  {

    // If isPrime[i] == True then i is prime number
    if (isprime[i]) {

      // put i into prime[] vector
      prime.append(i);

      // A prime number is its own smallest prime factor
      SPF[i] = i;
    }

    // Remove all multiples of  i*prime[j] which are
    // not prime by making isPrime[i*prime[j]] = false
    // and put smallest prime factor of i*Prime[j] as prime[j]
    // [for exp :let  i = 5, j = 0, prime[j] = 2 [ i*prime[j] = 10]
    // so smallest prime factor of '10' is '2' that is prime[j] ]
    // this loop run only one time for number which are not prime

    var j=0;
    while j < prime.count && i * prime[j] < N && prime[j] <= SPF[i] {
      isprime[i * prime[j]] = false;

      // put smallest prime factor of i*prime[j]
      SPF[i * prime[j]] = prime[j];
      j+=1;
    }
    i+=1;
  }
}

func main() {
  let N = 10
  var output = "[OUTPUT] ";
  var isprime = Array<Bool>(repeating:true, count:N );
  var prime = Array<Int>();
  var SPF = Array<Int>(repeating:2, count:N);

  seive(&isprime, &prime, &SPF, N);

  // print all prime number less then N
  var i=0;
  while i < prime.count && prime[i] <= N {
    output += "\(prime[i]), ";
    i+=1;
  }
  print("[INPUT] \(N)");
  print(output);
}

main()
