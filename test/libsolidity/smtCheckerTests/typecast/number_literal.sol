pragma experimental SMTChecker;

contract C {
  function f() public pure {
    uint x = 1234;
    uint y = 0;
    assert(x != y);
    assert(x == uint(1234));
    assert(y == uint(0));
  }
  function g() public pure {
    uint a = uint(0);
    uint b = uint(-1);
    uint c = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    int d = -1;
    uint e = uint(d);
    assert(a != b);
    // This works because literal type conversion works.
    assert(b == c);
    // This can't be solved because proper type conversion is not yet supported.
    assert(b == e);
  }
  function h() public pure {
    uint32 a = uint32(0);
    uint32 b = uint32(-1);
    uint32 c = 4294967295;
    int32 d = -1;
    uint32 e = uint32(d);
    assert(a != b);
    // This works because literal type conversion works.
    assert(b == c);
    // This can't be solved because proper type conversion is not yet supported.
    assert(b == e);
  }
}
// ----
// Warning 6328: (475-489): CHC: Assertion violation happens here.
// Warning 6328: (753-767): CHC: Assertion violation happens here.
// Warning 6328: (830-844): CHC: Assertion violation happens here.
// Warning 6328: (931-945): CHC: Assertion violation happens here.
// Warning 5084: (666-676): Type conversion is not yet fully supported and might yield false positives.
