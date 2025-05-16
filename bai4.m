s = tf('s');

G1 = s + 1;
G2 = tf(1, 1);
G3 = tf(1, 1);
H1 = s^3;
G4 = 1/s^2;


gtd1 = feedback(G1 * G2 * G3, 1, 1);
gtd2 = feedback(gtd1 * G4, H1 * 1/G1);
sys = feedback(gtd2, 1);

minreal(tf(sys))
% ltiview({'step';'impulse';'nyquist';'bode'}, sys)
