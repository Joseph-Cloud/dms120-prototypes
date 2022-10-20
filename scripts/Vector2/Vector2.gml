function Vector2(_x, _y) constructor {
	x = _x
	y = _y
}

function unit_v2(v) {
	if (zero_v2(v)) return v
	mag = magnitude_v2(v)
	return new Vector2(v.x/mag, v.y/mag)
}

function scale_v2(v, scalar) {
	return new Vector2(v.x * scalar, v.y * scalar)
}

function equals_v2(v1, v2) {
	return v1.x == v2.x && v1.y == v2.y
}

function add_v2(v1, v2) {
	return new Vector2(v1.x + v2.x, v1.y + v2.y)	
}

function subtract_v2(v1, v2) {
	return new Vector2(v1.x - v2.x, v1.y - v2.y)
}

function magnitude_v2(v) {
	return sqrt(sqr(v.x) + sqr(v.y))	
}

function zero_v2(v) {
	return v.x == 0 && v.y == 0
}