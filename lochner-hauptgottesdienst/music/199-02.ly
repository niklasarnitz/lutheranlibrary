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
      \new Voice = "soprano" { \voiceOne cis''2 b'4 b'4 \bar "|" a'1 \bar "|" b'2 a'2 \bar "|" g'1 \bar "|" fis'1 \bar "|" e'2 e'2 \bar "|" a'2 b'2 \bar "|" a'2 d'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo e'2 e'4 e'4 cis'1 g'2 fis'2 e'1 d'1 d'2 c'!2 e'2 d'2 d'2 d'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t ei -- ni -- gen "Sohn," un -- sern HEr -- "ren," der em -- pfan -- gen ist vom }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 gis4 \once \omit Accidental gis4 a1 d'2 d'2 b1 b1 g2 g2 c'!2 g2 fis2 fis2 }
      \new Voice = "bass" { \voiceTwo a,2 e4 e4 a,1 g2 d2 fis1 b,1 c!2 \once \omit Accidental c2 a,2 g,2 d2 b,2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
