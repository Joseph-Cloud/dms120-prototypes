function Vector2(_x, _y) constructor {
	x = _x
	y = _y
}

function unit_v2(v) {
	if (zero_v2(v)) return v
	mag = magnitude_v2(v)
	return new Vector2(v.x/mag, v.y/mag)
}

function normalize_v2(v, scalar) {
	if (zero_v2(v)) return v
	mag = magnitude_v2(v)
	return new Vector2(v.x/mag * scalar, v.y/mag * scalar)
}

function normal_cap_v2(v, scalar) {
	if magnitude_v2(v) > scalar
		return normalize_v2(v, scalar)
	else
		return new Vector2(v.x, v.y)
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

function interpolate_rot_v2(v1, v2, t, T) {
	if T == 0 return new Vector2(v2.x, v2.y)
	return add_v2(scale_v2(v1, cos(t/T * pi/2)), scale_v2(v2, sin(t/T * pi/2)))
}

function vector_between_v2(x1, y1, x2, y2) {
	return new Vector2(x2 - x1, y2 - y1)	
}