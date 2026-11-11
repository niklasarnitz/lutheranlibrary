\version "2.24.3"
% Scan 301, Nunc dimittis, printed music system 2.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 145\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 f'4 d'4 d'2 | c'1^\fermata | c'2 e'4 f'4 | g'2 g'2 | g'4 g'4 g'4 g'4 | g'2 a'4 g'4 }
   \new Voice = "a" { \voiceTwo c'4 b4 b2 | c'1 | c'2 c'4 c'4 | c'2 c'2 | c'4 e'4 e'4 e'4 | d'2 f'4 e'4 }
  >>
  \new Lyrics \lyricsto "s" { du ge -- sagt hast. Denn mei -- ne Au -- gen ha -- ben dei -- nen Hei -- land "ge-" }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 a4 g4 g2 | e1 | f2 g4 a4 | g2 g2 | g4 c'4 c'4 c'4 | a2 c'4 c'4 }
   \new Voice { \voiceTwo f4 f4 g,2 | c1_\fermata | c2 b,4 f4 | e2 e2 | e4 b,4 b,4 b,4 | f2 f4 b,4 }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }