100 DIM W(10) 'array of waiting times from t=0 to 8
101 DIM C(50)
110 INPUT S, NSTOP
120 FOR D = 1 TO NSTOP
    130 IA = -(1 / 4) * LOG(1 - RND)
    140 A = A + IA
    150 J = 0
    155 WT = 0
    160 J = J + 1
    165 IF J < (S + 1) THEN 190
    170 J = 1
    172 FOR N = 2 TO S
        174 IF C(N) < C(J) THEN J = N
    176 NEXT N
    178 WT = (C(J) - A)
    179 WX = WX + WT
    180 FOR I = 1 TO 9
        182 IF WT > (I - 1) * 2.4 THEN W(I) = W(I) + 1
    184 NEXT I
    186 GOTO 200
    190 IF A < C(J) THEN 160
    200 X = -2.4 * LOG(1 - RND)
    205 SX = SX + X
    210 C(J) = A + WT + X
220 NEXT D
230 PRINT "rho = ", (SX / A) / S
240 PRINT "E(W) = ", (WX) / (A * S)
250 FOR P = 1 TO 9
    260 PRINT "P(W> ", P - 1, ") = ", W(P) / NSTOP
270 NEXT P
