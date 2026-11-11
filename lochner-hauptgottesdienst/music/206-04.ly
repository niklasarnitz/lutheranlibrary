\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 181.
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
      \new Voice = "soprano" { \voiceOne fis'2 a'4 a'4 \bar "|" fis'2 d'2 \bar "|" d'4 d'4 a'2 \bar "|" b'4 b'4 a'2 \bar "|" d''2 cis''2 \bar "|" b'2 a'2 \bar "|" b'4 a'4 g'4 fis'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo a2 cis'4 e'4 d'2 a2 b4 b4 d'2 d'4 d'4 d'2 fis'2 fis'2 d'2 d'2 d'4 d'4 b4 d'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t der mit dem Va -- ter und dem Soh -- ne zu -- gleich an -- ge -- be -- tet und ge -- eh -- ret }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne fis2 e4 a4 a2 fis2 fis4 g4 a2 g4 g4 fis2 b2 a2 g2 fis2 g4 fis4 g4 a4 }
      \new Voice = "bass" { \voiceTwo d2 a,4 cis4 d2 d2 b,4 g,4 fis,2 g,4 g,4 d2 b,2 fis2 g2 d2 g,4 d4 e4 d4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
