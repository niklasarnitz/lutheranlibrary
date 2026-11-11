\version "2.24.3"
% Scan 301, Nunc dimittis, printed music system 3.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 145\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 g'2 r4 g'4 | a'4 b'4 c''4 a'4 | g'2 e'2 | f'4 d'4 d'2 | c'2^\fermata g'2 | g'2 c'4 f'4 }
   \new Voice = "a" { \voiceTwo e'2 s4 e'4 | f'4 f'4 g'4 fis'4 | e'2 c'2 | c'4 b4 b2 | c'2 c'2 | d'2 c'4 c'4 }
  >>
  \new Lyrics \lyricsto "s" { sehn, den du be -- rei -- tet hast für al -- len Völ -- kern, ein Licht zu "er-" }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 c'2 r4 c'4 | c'4 d'4 e'4 d'4 | b2 a2 | a4 g4 g2 | f2 f2 | e2 e4 a4 }
   \new Voice { \voiceTwo e2 s4 e4 | f4 d4 c4 d4 | f2 s2 | f4 s4 s2 | c2_\fermata c2 | c2 a,4 a,4 }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }