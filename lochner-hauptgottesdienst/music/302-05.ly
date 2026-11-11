\version "2.24.3"
% Scan 302, separately printed Abkürzung after the full Amen.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 85\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 d'4( c'4) d'2 | c'1^\fermata \bar "||" }
   \new Voice = "a" { \voiceTwo b4 c'2 b4 | c'1 \bar "||" }
  >>
  \new Lyrics \lyricsto "s" { Is __ ra __ el. }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 g4( e4) g2 | e1 \bar "||" }
   \new Voice { \voiceTwo g,4( a,4) g,2 | c1_\fermata \bar "||" }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }