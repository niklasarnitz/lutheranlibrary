\version "2.24.3"
% Scan 302, Nunc dimittis, printed music system 2.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 145\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 g'2 g'4 e'4 | f'4 d'4 d'2 | c'1^\fermata | g'4 g'4 c'4 f'4 | e'4 d'4 e'2 | g'2( a'4) g'4 }
   \new Voice = "a" { \voiceTwo e'2 c'4 c'4 | c'4 b4 b2 | c'1 | c'4 d'4 c'4 c'4 | c'4 b4 c'2 | e'2( f'4) d'4 }
   \new NullVoice = "align" { c'2 c'4 c'4 | c'4 c'4 c'2 | c'1 | c'4 c'4 c'4 c'4 | c'4 c'4 c'2 | c'2 c'4 c'4 }
  >>
  \new Lyrics \lyricsto "align" { Sohn und dem Hei -- li -- gen Geist, wie es war im An -- \skip 4 fang, jetzt \skip 4 und }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 c'2 c'4 c'4 | a4 g4 g2 | e1 | e4 d4 e4 a4 | a2 a2 | c'2. a4 }
   \new Voice { \voiceTwo c2 e4 a4 | f4 s4 g,2 | c1_\fermata | b,4 b,4 g,4 g,4 | b,4 g,4 b,2 | b,2( f4) g4 }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }