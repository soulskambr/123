contract C
{
	function f(uint x) public pure {
		for (uint data; data < x;)
			uint data2 = 1;
	}
}
// ----
// Warning: (79-89): Unused local variable.
