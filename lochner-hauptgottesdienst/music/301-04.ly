\version "2.24.3"
% Scan 301, Nunc dimittis, printed system 4. The final lower bass
% head on “Volks” is obscured by the scan blot. Its duration is reserved.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 145\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 e'4( d'4) e'4 g'4 | a'2 f'2 | g'4 a'4 g'2 | g'4( f'4 e'2) | d'4( e'4) e'4 s4 }
   \new Voice = "a" { \voiceTwo c'4( b4) c'4 b4 | d'2 d'2 | e'4 f'4 e'2 | e'4( d'4 c'2) | b4( c'4) c'4 s4 }
   \new NullVoice = "align" { c'4 c'4 c'4 c'4 | c'2 c'2 | c'4 c'4 c'2 | c'4 c'4 c'2 | c'4 c'4 c'2 }
  >>
  \new Lyrics \lyricsto "align" { leuch -- \skip 4 ten die Hei -- den und zum Preis dei -- \skip 4 \skip 2 nes \skip 4 Volks }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 g2 g4 g4 | g4( fis4) c'2 | c'4 c'4 c'2 | c'4( a4 g2) | g2 g2 }
   \new Voice { \voiceTwo c4( g,4) c4 e4 | d2 g,2 | c4 f4 c2 | c4( d4 e2) | g4( c4) s2 }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }