\version "2.24.3"
% Scan 140, printed p. 115, Liedfoermiges Kyrie no. 2, first printed system.
% The two sharps at “zu” are on G3 and E3 above D3.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 128\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \time 4/4
      \new Voice = "sung" { \voiceOne g'2 g'2 \bar "|" a'4 b'4 c''4 b'4 \bar "|" a'2 g'2 \bar "|" a'2 b'2 \bar "|" e'4 f'!4 f'4 e'4 \bar "|" d'2 c'2 \bar "|" }
      \new Voice { \voiceTwo d'2 d'2 \bar "|" fis'4 g'4 g'4 g'4 \bar "|" fis'2 e'2 \bar "|" d'2 d'2 \bar "|" c'4 c'4 b4 c'4 \bar "|" c'2 c'2 \bar "|" }
    >>
    \new Lyrics \lyricsto "sung" { O Va -- "ter," all -- mäch -- ti -- ger "Gott!" zu dir schrei -- en wir in der "Noth," }
    \new Staff <<
      \clef bass \time 4/4
      \new Voice { \voiceOne b2 b2 \bar "|" d'4 d'4 e'4 d'4 \bar "|" d'2 b2 \bar "|" <eis gis>2 a2 \bar "|" g4 a4 f4 g4 \bar "|" a2 f2 \bar "|" }
      \new Voice { \voiceTwo g2 g2 \bar "|" d4 f4 b,4 g,4 \bar "|" d2 g2 \bar "|" d2 g,2 \bar "|" d4 b,4 d4 b,4 \bar "|" g,2 d2 \bar "|" }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } }
}
