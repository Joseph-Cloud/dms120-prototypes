// Function for the discrete real exponentiation operator
function power_ext(base, pow) {
	show_debug_message("Power: " + string(pow));
	show_debug_message("Base: " + string(base));
	if (base >= 0) return power(base, pow);
	b = pow;
	c = 1;
	while(b % 1 != 0) {
		b *= 10;
		c *= 10;
	}
	show_debug_message("B: " + string(b));
	show_debug_message("C: " + string(c));
	show_debug_message("B pow: " + string(power(-1, b)));
	show_debug_message("Base pow: " + string(power(abs(base), b/c)));
	return power(-1, b) * power(abs(base), b/c);
}