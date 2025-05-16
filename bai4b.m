
G1 = tf(1, 1);
G2 = tf(1, 1);
G4 = tf(1, [1 0]);
G3 = tf([1 1], 1);
H1 = tf([1 0], 1);


gtd1 = feedback(G2, H1 * G3 * G4);
gtd2 = feedback(G1 * gtd1, 1, 1);
sys = feedback(gtd2 * G3 * G4, 1);


% G1.u = "ig1"; G1.y = 'og1';
% G2.u = 'ig2'; G2.y = 'og2';
% G3.u = 'og2'; G3.y = 'og3';
% G4.u = 'og3'; G4.y = 'y';
% H1.u = 'y'; H1.y = 'oh1';

% S1 = sumblk('u = r - y + og2');
% S3 = sumblk('ig2 = og1 - oh1');

% sys = connect(G1, G2, G3, G4, H1, S1, S2, 'r', 'y');
minreal(tf(sys));
ltiview({'step';'impulse';'nyquist';'bode'}, sys)
