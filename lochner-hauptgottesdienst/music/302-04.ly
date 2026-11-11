\version "2.24.3"
% Scan 302, Nunc dimittis, full final Amen, printed system 4 before Abkürzung.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 85\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 c'2( e'4 g'4 | e'4 d'4 f'4 e'4 | d'4 c'4 d'4 c'4) | c'1^\fermata \bar "||" }
   \new Voice = "a" { \voiceTwo c'2.( d'4 | c'4 b4 c'2 | b4 c'4 b4 c'4) | c'1 \bar "||" }
   \new NullVoice = "align" { c'2 c'4 c'4 | c'4 c'4 c'4 c'4 | c'4 c'4 c'4 c'4 | c'1 }
  >>
  \new Lyrics \lyricsto "align" { A \skip 4 \skip 4 \skip 4 \skip 4 \skip 4 \skip 4 \skip 4 \skip 4 \skip 4 \skip 4 men. }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 g2( a4 g4 | g2 a4 g4 | a4 e4 a4 e4) | e1 \bar "||" }
   \new Voice { \voiceTwo c2( a,4 c4 | c4 g,4 f,4 c4 | g,4 a,4 g,4 c4) | c1_\fermata \bar "||" }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }