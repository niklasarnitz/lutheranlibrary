\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 130 (scan 155), second printed system.
% Treble chord counts checked against a staff-grid overlay at 600 dpi.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp g2\pp gis2 | a4\< a4 a4 a4\! | b2^\markup { \italic "cresc." } b4 b4 | c'2\f c'2 | fis2\p g2 | a4(\< b4) c'4 c'4\! \bar "|" }
alto = \fixed c' { \global d2 e2 | e4 e4 e4 e4 | g2 g4 g4 | e2 e2 | d2 d2 | fis4( g4) a4 fis4 }
tenor = \fixed c { \global b2 b2 | c'4 c'4 c'4 c'4 | d'2 d'4 d'4 | c'2 c'2 | a2 b2 | c'4( b4) a4 d'4 }
bass = \fixed c { \global g2 e2 | a4 a4 a4 a4 | g2 g4 g4 | c2 c2 | d2 d2 | d4 d4 d4 d4 }
words = \lyricmode { JE -- sus Chri -- stus mit dem Hei -- li -- gen Gei -- ste in der Herr -- lich -- keit __ }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
