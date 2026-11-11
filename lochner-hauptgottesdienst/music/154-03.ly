\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 129 (scan 154), third printed system.
% Three-head upper chords on Welt/auf and five short ff chords are preserved.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp a2^\markup { \italic "cres . . ." } a4 g4 | g2^\markup { \italic "cen . . ." } fis4 fis4 | g2^\markup { \italic "do." } a4 a8 a8 | \partial 2 b2\f\fermata | b4\ff b4 b4 b8 b8 \bar "|" }
alto = \fixed c' { \global fis2 fis4 g4 | e2 dis4 dis4 | e2 e4 e8 e8 | \partial 2 dis!2 | g4 g4 g4 g8 g8 }
tenor = \fixed c { \global d'2 d'4 b4 | b2 b4 b4 | b2 a4 a8 a8 | \partial 2 fis2 | d'!4 d'4 d'4 d'8 d'8 }
bass = \fixed c { \global d2 d4 e4 | e2 b,4 b,4 | e2 c4 c8 c8 | \partial 2 b,2\fermata | g,4\ff g,4 g4 g8 g8 }
words = \lyricmode { Sün -- de der Welt trägt, nimm auf un -- ser Ge -- bet! Der du si -- zest zur }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
