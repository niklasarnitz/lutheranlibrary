\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 130 (scan 155), final printed system.
% The long final Amen and thick closing bar terminate the setting.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp b2 b4 b4 | c'2 c'2->\fermata | a2\< b2\! | c'2\> b2\! | b4( a4 g4 a4) | g\breve \bar "|." }
alto = \fixed c' { \global g2 g4 g4 | g2 g2 | fis2 g2 | a2 g2 | d1 | d\breve }
tenor = \fixed c { \global d'2 d'4 d'4 | e'2 e'2 | a2 g2 | fis2 g2 | g4 a4 b4 c'4 | b\breve }
bass = \fixed c { \global g2 g4 g4 | c'2 c2->_\fermata | d1( | d1)( | d1) | g,\breve }
words = \lyricmode { Got -- tes des Va -- ters. A -- men. A -- men. A __ __ __ men. }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
  \new Lyrics \lyricsto "bass" { \skip 2 \skip 4 \skip 4 \skip 2 \skip 2 A __ __ men. }
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
