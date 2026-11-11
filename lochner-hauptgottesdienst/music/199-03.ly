\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne fis'2 e'4 e'4 \bar "|" d'1\fermata \bar "|" a'2 b'4 b'4 \bar "|" a'2 fis'2 \bar "|" g'4 g'4 g'2 \bar "|" a'4( g'4) fis'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 d'4 cis'4 d'1 fis'2 g'4 g'4 fis'2 d'2 d'4 d'4 e'2 e'2 d'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Hei -- li -- gen "Geist," ge -- bo -- ren aus Ma -- ri -- a der Jung \skip 1 "frau-" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a4 a4 fis1 d'2 d'4 d'4 d'2 a2 b4 b4 b2 a2 a2 }
      \new Voice = "bass" { \voiceTwo a,2 a,4 a,4 d1\fermata d2 g4 g4 d2 d2 b,4 b,4 e2 cis2 d2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
