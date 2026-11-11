\version "2.24.3"
% Scan 302, Nunc dimittis, printed music system 1.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 145\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new PianoStaff <<
  \new Staff <<
   \new Voice = "s" { \voiceOne \clef treble \omit Staff.TimeSignature \time 4/4 e'4( d'4 g'4 e'4 | c'2 f'4 e'4 | d'4 c'4) d'4( c'4) | c'1^\fermata | g'2 e'4 f'4 | g'4 g'4 a'4 g'4 }
   \new Voice = "a" { \voiceTwo c'4( d'4 c'2 | c'2 s2 | b4 c'4) b4( c'4) | c'1 | e'2 c'4 c'4 | c'4 e'4 f'4 d'4 }
   \new NullVoice = "align" { c'4 c'4 c'4 c'4 | c'2 c'4 c'4 | c'4 c'4 c'4 c'4 | c'1 | c'2 c'4 c'4 | c'4 c'4 c'4 c'4 }
  >>
  \new Lyrics \lyricsto "align" { Is \skip 4 \skip 4 \skip 4 \skip 2 \skip 4 \skip 4 \skip 4 \skip 4 ra \skip 4 el. Ehr sei dem Va -- ter und dem }
  \new Staff <<
   \new Voice { \voiceOne \clef bass \omit Staff.TimeSignature \time 4/4 a4.( g8 e4 g4 | e2 a4 g4~ | g4 e4) g4( e4) | e1 | c'2 c'4 a4 | g4 c'4 c'4 b4 }
   \new Voice { \voiceTwo a,4 b,4 c2 | c2 a,4 c4 | g,4 a,4 g,4( c4) | c1_\fermata | c2 a4 f4 | e4 c4 f4 g4 }
  >>
 >>
 \layout { \context { \Score \remove "Bar_number_engraver" } } }