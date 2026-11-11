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
      \new Voice = "soprano" { \voiceOne fis'4 g'4 e'2 \bar "|" d'1 \bar "|" fis'4 g'4 a'2 \bar "|" b'2 a'2 \bar "|" fis'4 g'4 e'2 \bar "|" d'1\fermata \bar "|."  \bar "|" }
      \new Voice = "alto" { \voiceTwo d'4 d'4 d'4( cis'4) d'1 d'4 d'4 d'2 d'2 d'2 d'4 d'4 d'4( cis'4) d'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t "wird," zu rich -- ten die Le -- ben -- di -- gen und die Tod -- "ten." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a4 b4 a2 fis1 b4 b4 a2 g2 fis2 a4 b4 a2 fis1 }
      \new Voice = "bass" { \voiceTwo d4 g,4 a,2 d1 b4 g4 fis2 g2 d2 d4 g,4 a,2 d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
