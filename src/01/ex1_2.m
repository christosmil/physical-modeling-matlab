a_gravity = 9.8;
h = 381;
terminal_v = 18;
terminal_t = terminal_v / a_gravity;
terminal_h = a_gravity*terminal_t/2;
remaining_h = h - terminal_h;
temp = remaining_h/terminal_v;
t = terminal_t + temp;
disp(t);