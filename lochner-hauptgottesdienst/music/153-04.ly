\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 128 (scan 153), fourth printed system.
% Shared A3 at "Chri" in lower staff: sustained tenor whole plus bass half, then bass G2 half.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp b2 ais2 | b2.\> b4\! | cis'4.^\markup { \italic "cres . ." } cis'8 cis'4^\markup { \italic "cen . ." } cis'4 | d'2^\markup { \italic "do" } d'4 d'4 | d'2\f( cis'2)\> | d'2\! r2 \bar "|." }
alto = \fixed c' { \global fis2 fis2 | fis2. fis4 | a4. a8 a4 a4 | a2 g4 e4 | fis2( e2) | fis2 s2 }
tenor = \fixed c { \global d'2 cis'2 | d'2. d'4 | e'4. e'8 e'4 e'4 | d'2 b4 b4 | a1 | a2 r2 }
bass = \fixed c { \global fis2 fis2 | b,2.\> b,4\! | a,4. a,8 a4 a4 | fis2 g4 g4 | a2( a,2) | d2 s2 }
words = \lyricmode { Va -- ter. HErr, du ein -- ge -- bor -- ner Sohn, JE -- sus Chri -- stus. }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
