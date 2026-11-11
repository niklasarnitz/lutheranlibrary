\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 128 (scan 153), third printed system.
% Final bass bar has closely printed accidentals; see scans/153-s3-c-3x.png.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global b2 ais4 ais4 | b4 b4 r2 | d'2\ff d'2 | d'2 d'4 d'4 | e'2 d'4 d'4 | d'2\> cis'4 b4\! \bar "|" }
alto = \fixed c' { \global fis2 fis4 fis4 | fis4 fis4 s2 | b2 b2 | b2 b4 b4 | b2 b4 fis4 | fis2 e4 d4 }
tenor = \fixed c { \global fis'2 cis'4 cis'4 | d'4 d'4 r2 | fis'2 fis'2 | fis'2 fis'4 fis'4 | g'2 fis'4 d'4 | b2 ais4 b4 }
bass = \fixed c { \global b2 fis4 fis4 | b,4 b,4 s2 | b2 b2 | b2 b4 b4 | b2 b4 b4 | fis2\> fis4 fis4\! }
words = \lyricmode { Herr -- lich -- keit wil -- len. HErr Gott, himm -- li -- scher Kö -- nig, all -- mäch -- ti -- ger }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
