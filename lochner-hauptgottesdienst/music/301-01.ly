\version "2.24.3"
% Scan 301, Nunc dimittis, printed music system 1.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 145\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \time 4/4 c'2 e'4 f'4 | g'4 g'4 g'4 g'4 | a'2 g'4 g'4 | a'4 b'4 c''4( a'4) | g'2 e'2 }
   \new Voice = "a" { \voiceTwo c'2 c'4 c'4 | c'4 c'4 c'4 e'4 | e'2 e'4 e'4 | f'4 f'4 g'4( fis'4) | e'2 c'2 }
  >>
  \new Lyrics \lyricsto "s" { HEr -- re, nun läßt du dei -- nen Die -- ner in Frie -- den fah -- ren, wie }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \time 4/4 f2 a4 b4 | a4 a4 a4 c'4 | c'2 c'4 c'4 | c'4 d'4 e'4( d'4) | c'2 b2 }
   \new Voice { \voiceTwo c2 b,4 f4 | e4 e4 e4 b,4 | f2 b,4 b,4 | f4 d4 b,4( d4) | f2 s2 }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }