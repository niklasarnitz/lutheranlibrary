\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 180.
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
      \new Voice = "soprano" { \voiceOne fis'2 a'2 \bar "|" fis'2 d'2 \bar "|" d'2 a'4 a'4 \bar "|" b'4 b'4 a'2 \bar "|" b'2 a'4 g'4 \bar "|" fis'4 fis'4 e'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 e'2 d'2 b2 a4( d'8[ e'8]) fis'4 e'4 g'4 g'4 fis'2 g'2 e'4 e'4 e'4 dis'4 b4.( cis'!8) }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t und wird wie -- der kom men mit Herr -- lich -- "keit," zu rich -- ten die Le -- "ben-" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a2 a2 g2 fis2 d'4 cis'4 d'4 d'4 d'2 d'2 c'!4 b4 b4 b4 g2 }
      \new Voice = "bass" { \voiceTwo d2 cis2 d2 g,2 d2 d4 a4 g4 g4 d2 g2 a4 e4 b,4 b,4 e2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
