\version "2.24.3"
\pointAndClickOff
% Lochner p.124, scan 149, congregation after the pastor's Gloria.
% All three printed systems of the congregational continuation.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 115\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 4/4 \cadenzaOn }
soprano = \fixed c' { \global
  g2 g4 a4 b4 g4 cis'4 cis'4 b2 \bar "|" r4 a4 b4 cis'4 d'4 b4 cis'4 a4 g2 \bar "|" \break
  r4 cis'4 cis'4 cis'4 a4 g4 a4 fis4 e2 \bar "|"
  r4 \once \stemDown d4 g4 a4 b4 cis'4 a4 a4 g2 \bar "|" \break
  r4 d'4 d'4 b4 cis'4 d'4 b4 a4 b2 \bar "|"
  r4 cis'4 b4 a4 g4 e4 g4( b4) a2 g1 \bar "|."
}
alto = \fixed c' { \global
  d2 e4 fis4 g4 e4 g4 fis4 g2 \bar "|" r4 fis4 g4 g4 fis4 g4 e4 d4 b,2 \bar "|"
  r4 e4 e4 fis4 g4 e4 e4 d4 cis!2 \bar "|"
  r4 s4 d4 fis4 g4 g4 g4 fis4 e2 \bar "|"
  r4 d4 d4 g4 g4 a4 g4 fis4 g2 \bar "|"
  r4 g4 g4 fis4 e4 d4 b,4( d2) d4 b,1 \bar "|."
}
tenor = \fixed c { \global
  b2 b4 d'4 d'4 b4 e'4 cis'4 d'2 \bar "|" r4 d'4 d'4 e'4 a4 g4 g4 fis4 g2 \bar "|"
  r4 g4 g4 cis'4 d'4 b4 a4 a4 a2 \bar "|"
  r4 fis4 g4 cis'4 d'4 e'4 d'4 d'4 b2 \bar "|"
  r4 b4 a4 d'4 e'4 d'4 d'4 cis'4 d'2 \bar "|"
  r4 e'4 d'4 d'4 b4 a4 g2. fis4 g1 \bar "|."
}
bass = \fixed c { \global
  g2 e4 d4 b,4 e4 cis4 a,4 g,2 \bar "|" r4 d4 g4 e4 d4 e4 cis4 d4 g,2 \bar "|"
  r4 cis4 cis4 g,4 a,4 e8 d8 cis!4 d4 g,2 \bar "|"
  r4 d8 b,8 b,4 a,4 g,4 cis4 d4 d4 fis,2 \bar "|"
  r4 g4 fis4 g4 d4 e4 g4 a4 g2 \bar "|"
  r4 cis4 g4 d4 e4 fis4 e4( b,8) cis8 d2 g,1 \bar "|."
}
words = \lyricmode {
  All Ehr und Lob soll Got -- tes sein,
  er ist und bleibt der Höchst al -- lein.
  Sein Zorn auf Er -- den hat ein End,
  sein Fried und Gnad sich zu uns wend,
  den Men -- schen das ge -- fal -- le wohl,
  da -- für man herz -- lich dan __ ken soll.
}
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff \remove "Bar_number_engraver" } \context { \Lyrics \override LyricText.font-size = #-2 } } }
