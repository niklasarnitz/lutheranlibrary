\version "2.24.3"
% Lochner, I. Sanctus. Source pages 218–219.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''2( a'2) \bar "|" f'1\fermata \bar "|" f'2( a'2 \bar "|" c''2 d''2) \bar "|" c''1\fermata \bar "|" c''2( a'2) \bar "|" f'2 a'2 \bar "|" f'1 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'1 f'1 f'1( g'1) e'1 f'1 f'2 f'2 f'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Hei \skip 1 "lig!" Hei \skip 1 \skip 1 \skip 1 "lig!" Hei \skip 1 lig ist "Gott," }
    \new Staff <<
      \clef bass \global \cadenzaOn
      \new Voice { \voiceOne a2( c'2) a1 a2( c'2~ c'2 b!2) c'1 a2( c'2) a2 c'2 a1 }
      \new Voice = "bass" { \voiceTwo f1 f1\fermata f1( e2 g2) c1\fermata f1 f2 a,2 d1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
