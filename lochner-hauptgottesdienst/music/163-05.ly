\version "2.24.3"
% Scan 163, printed p. 138: Erscheine, der du sitzest über Cherubim, and both Halleluja cadences.
#(set-global-staff-size 16)
\header { piece = "G." tagline = ##f }
\paper {
  paper-width = 115\mm
  left-margin = 3\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \cadenzaOn
      \new Voice = "choir" { \voiceOne g'4 g'2 g'2 g'4 g'4 g'2 g'2 g'4 g'4 g'4 e'4 g'2 \bar "|"
            g'4 g'2 g'2 g'4 g'4 fis'2 g'2 \bar "" \break g'2 a'2 g'1 e'1 \bar "||" g'2^\markup \tiny "Oder:" a'2 g'2( f'!2) e'1 \bar "|." }
      \new Voice { \voiceTwo e'4 e'2 e'2 e'4 e'4 d'2 d'2 e'4 e'4 e'4 c'4 e'2
            e'4 e'2 e'2 e'4 e'4 d'2 d'2 \break e'2 f'!2 d'1 c'1 e'2 f'!2 e'2( d'2) c'1 }
    >>
    \new Lyrics \lyricsto "choir" { Er -- schei -- ne, der du si -- tzest ü -- ber Che -- ru -- bim, und kom -- me uns zu Hil -- fe. Hal -- le -- lu -- "ja!" Hal -- le -- lu __ "ja!" }
    \new Staff <<
      \clef bass \cadenzaOn
      \new Voice { \voiceOne c'4 c'2 c'2 c'4 c'4 b2 b2 c'4 c'4 c'4 g4 c'2
            c'4 c'2 c'2 c'4 c'4 a2 b2 \break c'2 c'1 b2 a1 c'2 c'2 c'2.( b4) a1 }
      \new Voice { \voiceTwo c4 c2 c2 c4 c4 g2 g2 c4 c4 c4 c4 c2
            c4 c2 c2 c4 c4 d2 g,2 \break c2 f,2 g,1 c1 c2 f,2 g,1 c1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
