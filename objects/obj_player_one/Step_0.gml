// acceleration based movement
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

var h_move = key_right - key_left
var v_move = key_down - key_up

var e_hsp = hsp + acc * h_move - (h_move == 0 ? dec * sign(hsp) : 0)
var e_vsp = vsp + acc * v_move - (v_move == 0 ? dec * sign(vsp) : 0)

if abs(e_hsp) > spcap
	hsp = spcap * sign(hsp);
else
	hsp = e_hsp;

if abs(e_vsp) > spcap
	vsp = spcap * sign(vsp);
else
	vsp = e_vsp;
	
x += hsp;
y += vsp;