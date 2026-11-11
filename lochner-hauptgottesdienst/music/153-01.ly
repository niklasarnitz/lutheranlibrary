\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 128 (scan 153), first printed system.
% The half-note chords on "dich" (bar 4) and "be" (bar 5) have three upper heads.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \time 4/4 }
soprano = \fixed c' { \global r2 r4 b4 | c'4.-> c'8 b4 b4 | b4 b4 c'4.-> c'8 | b2 r4 a4\p | g2 fis4 fis4 \bar "|" }
alto = \fixed c' { \global s2 s4 g4 | g4. g8 g4 g4 | g4 g4 g4. g8 | g2 s4 fis4 | e2 dis4 dis4 }
tenor = \fixed c { \global r2 r4 d'4 | e'4. e'8 d'4 d'4 | d'4 d'4 e'4. e'8 | d'2 r4 d'4 | b2 b4 b4 }
bass = \fixed c { \global s2 s4 g4 | c'4. c'8 g4 g4 | g4 g4 c4. c8 | g,2 s4 d4 | e2 b,4 b,4 }
words = \lyricmode { Wir lo -- ben dich, wir be -- ne -- dei -- en dich, wir be -- ten dich }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
