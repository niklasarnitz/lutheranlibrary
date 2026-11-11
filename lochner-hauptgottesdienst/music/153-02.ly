\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 128 (scan 153), second printed system.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp g2 r4 g4\mf | a4. a8 a4^\markup { \italic "cresc." } a4 | b2 a4\> a4\! | g2 r4 b4\f | b4. b8 b4 b4 \bar "|" }
alto = \fixed c' { \global e2 s4 e4 | fis4. fis8 fis4 fis4 | g2 fis4 fis4 | g2 s4 g4 | g4. g8 g4 g4 }
tenor = \fixed c { \global b2 r4 b4 | d'4. d'8 d'4 d'4 | d'2 d'4 c'4 | b2 r4 d'4 | d'4. d'8 e'4 e'4 }
bass = \fixed c { \global e2 s4 e4 | d4. d8 d4 d4 | g,2 d4 d4 | g,2 s4 g4 | g4. g8 e4 e4 }
words = \lyricmode { an, wir prei -- sen dich, wir sa -- gen dir Dank um dei -- ner gro -- ßen }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
