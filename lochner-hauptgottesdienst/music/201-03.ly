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
      \new Voice = "soprano" { \voiceOne a'2 b'4 cis''4 \bar "|" d''2 b'2 \bar "|" cis''2 b'4 b'4 \bar "|" a'1\fermata \bar "|" b'2 a'2 \bar "|" g'2 g'2 \bar "|" fis'1 \bar "|" e'2 e'4 e'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2 g'4 g'4 fis'2 e'2 e'2 e'4 e'4 e'1 g'2 fis'2 fis'2 e'2 d'1 d'2 c'!4 \once \omit Accidental c'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Ich glau -- be an den Hei -- li -- gen "Geist," Ei -- ne hei -- li -- ge christ -- li -- che }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne d'2 d'4 e'4 a2 gis2 a2 a4 gis4 cis'1 d'2 d'2 b2 b2 b1 g2 g4 g4 }
      \new Voice = "bass" { \voiceTwo d2 g4 e4 d2 e2 a,2 e4 e4 a,1\fermata g2 d2 e2 e2 b,1 c!2 \once \omit Accidental c4 \once \omit Accidental c4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
