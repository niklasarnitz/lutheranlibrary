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
      \new Voice = "soprano" { \voiceOne a'2 b'4 b'4 \bar "|" a'2 d'4 d'4 \bar "|" fis'2 e'2 \bar "|" d'2\fermata d'2 \bar "|" a'2 b'4 b'4 \bar "|" a'2 fis'2 \bar "|" g'4 g'4 g'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo e'2 d'4 d'4 d'2 d'4 d'4 d'2 cis'2 d'2 d'2 e'2 d'4 d'4 cis'2 d'2 d'4 d'4 d'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t "Kirch," die Ge -- mei -- ne der Hei -- li -- "gen," Ver -- ge -- bung der Sün -- "den," Auf -- er -- "ste-" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'!2 g4 g4 fis2 fis4 gis4 a2 a2 fis2 fis2 fis2 fis4 g4 e2 b2 b4 b4 b2 }
      \new Voice = "bass" { \voiceTwo a,2 g,4 g,4 d2 b,4 b,4 a,2 a,2 d2\fermata d2 cis2 b,4 g,4 a,2 b,2 g,4 g,4 g2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
